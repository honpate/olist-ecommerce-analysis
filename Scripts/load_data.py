"""Load Olist CSVs into PostgreSQL."""

import os
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, URL
from dotenv import load_dotenv

load_dotenv()

url = URL.create(
    "postgresql+psycopg2",
    username=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    host=os.getenv("DB_HOST"),
    port=int(os.getenv("DB_PORT")),
    database=os.getenv("DB_NAME")
)

engine = create_engine(url)

RAW = Path("data/raw")

TABLES = {
    "olist_customers_dataset.csv": "customers",
    "olist_orders_dataset.csv": "orders",
    "olist_order_items_dataset.csv": "order_items",
    "olist_order_payments_dataset.csv": "order_payments",
    "olist_order_reviews_dataset.csv": "order_reviews",
    "olist_products_dataset.csv": "products",
    "olist_sellers_dataset.csv": "sellers",
    "olist_geolocation_dataset.csv": "geolocation",
    "product_category_name_translation.csv": "category_translation",
}

for filename, table in TABLES.items():
    df = pd.read_csv(RAW / filename)
    df.to_sql(table, engine, if_exists="replace", index=False, chunksize=10_000)
    print(f"{table:<22} {len(df):>8,} rows")

print("\nDone.")