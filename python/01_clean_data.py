import pandas as pd

pd.set_option("display.width", 200)

df = pd.read_csv(r"C:\Users\adity\Documents\Ecommerce-Customer-Sales-Analytics\data\raw\sample_ecommerce_transactions.csv")
raw_rows, raw_cols = df.shape

# ---------- 3.2: Load and look at the CSV ----------
print("Rows, columns:", df.shape)
print(df.head())
print(df.info())

# ---------- 3.3: Find the data problems ----------
dup_cols = [c for c in df.columns if c != "TransactionID"]
print("Duplicates (ignoring TransactionID):", df.duplicated(subset=dup_cols).sum())
print("Cancelled by InvoiceNo (starts with C):", df["InvoiceNo"].astype(str).str.startswith("C").sum())

m = df.isna().sum()
print("Missing values:")
print(m[m > 0])

print("OrderStatus:")
print(df["OrderStatus"].value_counts())

print("Odd rows:")
print(df.loc[(df["Quantity"] <= 0) | (df["UnitPrice"] <= 0) | (df["UnitPrice"] > 500), ["TransactionID", "Quantity", "UnitPrice", "OrderStatus"]])

# ---------- 3.4: Clean text and remove the duplicate ----------
df["Country"] = df["Country"].str.strip().str.title()
df["Country"] = df["Country"].replace({"Usa": "United States"})
df["Description"] = df["Description"].str.strip().str.replace(r"\s+", " ", regex=True)
cols = [c for c in df.columns if c != "TransactionID"]
df = df.drop_duplicates(subset=cols, keep="first")

# ---------- 3.5: Fix InvoiceDate ----------
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"], format="%d-%m-%Y %H:%M", errors="coerce")

# ---------- 3.6: Check cancelled invoices ----------
starts_with_c = df["InvoiceNo"].astype(str).str.startswith("C")
print(pd.crosstab(starts_with_c, df["OrderStatus"]))

# ---------- 3.7: Flag odd rows and fill missing values ----------
df["IsMissingCustomer"] = df["CustomerID"].isna()
df["IsZeroPrice"] = df["UnitPrice"] <= 0
df["IsPriceOutlier"] = df["UnitPrice"] > 500
df["IsNegativeQty"] = df["Quantity"] < 0

for col in ["Description", "CustomerID", "CustomerName", "Country"]:
    df[col] = df[col].fillna("Unknown")

# ---------- 3.8: Add derived columns ----------
df["Revenue"] = df["Quantity"] * df["UnitPrice"]
df["InvoiceYear"] = df["InvoiceDate"].dt.year
df["InvoiceMonth"] = df["InvoiceDate"].dt.month
df["InvoiceMonthName"] = df["InvoiceDate"].dt.month_name()
df["IsCancelled"] = (df["OrderStatus"] == "Cancelled") | df["InvoiceNo"].astype(str).str.startswith("C")
df["IsReturned"] = df["OrderStatus"] == "Returned"

# ---------- 3.9: Save the cleaned file ----------
output_path = r"C:\Users\adity\Documents\Ecommerce-Customer-Sales-Analytics\data\cleaned\cleaned_ecommerce_transactions.csv"
df.to_csv(output_path, index=False)

# ---------- 3.10: Final summary (copy these numbers into documentation/cleaning_log.md) ----------
print("\n===== CLEANING SUMMARY =====")
print("Saved:", output_path)
print("Raw rows, columns:", (raw_rows, raw_cols))
print("Cleaned rows, columns:", df.shape)
print("Rows removed:", raw_rows - len(df))
print("Missing values left:", df.isna().sum().sum())
print("Cancelled lines:", df["IsCancelled"].sum())
print("Returned lines:", df["IsReturned"].sum())
print("Zero price rows:", df["IsZeroPrice"].sum())
print("Price outlier rows:", df["IsPriceOutlier"].sum())
print("Gross revenue:", round(df["Revenue"].sum(), 2))