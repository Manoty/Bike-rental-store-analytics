import duckdb
import os

con = duckdb.connect("dev.duckdb")

raw_path = "data/raw"

for filename in os.listdir(raw_path):
    if filename.endswith(".csv"):
        table_name = filename.replace(".csv", "")
        filepath = os.path.join(raw_path, filename).replace("\\", "/")
        con.execute(f"CREATE OR REPLACE TABLE {table_name} AS SELECT * FROM read_csv_auto('{filepath}')")
        count = con.execute(f"SELECT COUNT(*) FROM {table_name}").fetchone()[0]
        print(f"Loaded {table_name}: {count} rows")

con.close()
print("\nDone. All tables loaded into dev.duckdb")