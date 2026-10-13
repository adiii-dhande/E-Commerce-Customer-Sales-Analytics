import pandas as pd

df = pd.read_csv(r"C:\Users\adity\Documents\Ecommerce-Customer-Sales-Analytics\data\raw\sample_ecommerce_transactions.csv")

# ---------- 3.4: Clean text and remove the duplicate ----------
df["Country"] = df["Country"].str.strip().str.title()
df["Country"] = df["Country"].replace({"Usa": "United States"})
df["Description"] = df["Description"].str.strip().str.replace(r"\s+", " ", regex=True)
cols = [c for c in df.columns if c != "TransactionID"]
df = df.drop_duplicates(subset=cols, keep="first")

# ---------- 3.5: Fix InvoiceDate ----------
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"], format="%d-%m-%Y %H:%M", errors="coerce")

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

print("Saved:", output_path)
print("Rows, columns:", df.shape)
print("Gross revenue:", round(df["Revenue"].sum(), 2))