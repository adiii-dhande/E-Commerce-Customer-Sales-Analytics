from pathlib import Path
import pandas as pd

pd.set_option("display.width", 200)

# project root = parent of the /python folder this script lives in
ROOT = Path(__file__).resolve().parent.parent
RAW_PATH = ROOT / "data" / "raw" / "transactions_raw.csv"
CLEAN_PATH = ROOT / "data" / "cleaned" / "transactions_clean.csv"
SAMPLE_PATH = ROOT / "data" / "cleaned" / "sample_transactions.csv"

df = pd.read_csv(RAW_PATH)
raw_rows, raw_cols = df.shape

# ---------- 3.2: Load and look at the CSV ----------
print("Rows, columns:", df.shape)
print(df.head())
print(df.info())

# ---------- 3.3: Find the data problems ----------
print("Duplicate TransactionIDs:", df.duplicated(subset="TransactionID").sum())
print("Cancelled by InvoiceNo (starts with C):", df["InvoiceNo"].astype(str).str.startswith("C").sum())

m = df.isna().sum()
print("Missing values:")
print(m[m > 0])

print("OrderStatus:")
print(df["OrderStatus"].value_counts())

print("Country (before cleaning):")
print(df["Country"].value_counts(dropna=False))

odd = (df["Quantity"] <= 0) | (df["UnitPrice"] <= 0) | (df["UnitPrice"] > 500)
print("Odd rows (qty <= 0, price <= 0 or price > 500):", odd.sum())
print(df.loc[odd, ["TransactionID", "Quantity", "UnitPrice", "OrderStatus"]].head(10))

# ---------- 3.4: Clean text and remove the duplicates ----------
df["Country"] = df["Country"].str.strip().str.title()
df["Country"] = df["Country"].replace({"Usa": "United States"})
df["Description"] = df["Description"].str.strip().str.replace(r"\s+", " ", regex=True)
# duplicates share the same TransactionID (the primary key), so dedupe on that
df = df.drop_duplicates(subset="TransactionID", keep="first")

# ---------- 3.5: Fix InvoiceDate ----------
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"], format="%Y-%m-%d %H:%M:%S", errors="coerce")

# ---------- 3.6: Check cancelled invoices ----------
starts_with_c = df["InvoiceNo"].astype(str).str.startswith("C")
print(pd.crosstab(starts_with_c, df["OrderStatus"]))

# ---------- 3.7: Flag odd rows and fill missing values ----------
# flags are saved as 0/1 so MySQL LOAD DATA can read them into TINYINT columns
df["IsMissingCustomer"] = df["CustomerID"].isna().astype(int)
df["IsZeroPrice"] = (df["UnitPrice"] <= 0).astype(int)
df["IsPriceOutlier"] = (df["UnitPrice"] > 500).astype(int)
df["IsNegativeQty"] = (df["Quantity"] < 0).astype(int)

for col in ["Description", "CustomerID", "CustomerName", "Country"]:
    df[col] = df[col].fillna("Unknown")

# ---------- 3.8: Add derived columns ----------
df["Revenue"] = (df["Quantity"] * df["UnitPrice"]).round(2)
df["InvoiceYear"] = df["InvoiceDate"].dt.year
df["InvoiceMonth"] = df["InvoiceDate"].dt.month
df["InvoiceMonthName"] = df["InvoiceDate"].dt.month_name()
df["IsCancelled"] = ((df["OrderStatus"] == "Cancelled") | df["InvoiceNo"].astype(str).str.startswith("C")).astype(int)
df["IsReturned"] = (df["OrderStatus"] == "Returned").astype(int)

# ---------- 3.9: Save the cleaned file + a small sample ----------
CLEAN_PATH.parent.mkdir(parents=True, exist_ok=True)
df.to_csv(CLEAN_PATH, index=False)
df.head(1000).to_csv(SAMPLE_PATH, index=False)  # small file, safe to commit to GitHub

# ---------- 3.10: Final summary (copy these numbers into documentation/cleaning_log.md) ----------
print("\n===== CLEANING SUMMARY =====")
print("Saved:", CLEAN_PATH)
print("Raw rows, columns:", (raw_rows, raw_cols))
print("Cleaned rows, columns:", df.shape)
print("Rows removed:", raw_rows - len(df))
print("Missing values left:", df.isna().sum().sum())
print("Missing customers:", df["IsMissingCustomer"].sum())
print("Cancelled lines:", df["IsCancelled"].sum())
print("Returned lines:", df["IsReturned"].sum())
print("Zero price rows:", df["IsZeroPrice"].sum())
print("Price outlier rows:", df["IsPriceOutlier"].sum())
print("Gross revenue:", round(df["Revenue"].sum(), 2))