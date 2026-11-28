"""Read a small CSV (name, city, amount) and print the mean amount per city.

Usage:
    python tools/pandas_practice.py <csv file>
    python tools/pandas_practice.py tools/sales.csv
"""
import argparse

import pandas as pd


def main():
    parser = argparse.ArgumentParser(description="Mean amount per city from a CSV.")
    parser.add_argument("csv", help="CSV file with columns name, city, amount")
    args = parser.parse_args()

    df = pd.read_csv(args.csv)

    # A few things from "10 minutes to pandas", just to look at the data first
    print("First rows:")
    print(df.head(), "\n")
    print(f"{len(df)} rows, columns: {list(df.columns)}\n")
    print("Orders over 500:")
    print(df[df["amount"] > 500].sort_values("amount", ascending=False), "\n")

    # The actual task: group by city, then take the mean of amount
    per_city = df.groupby("city")["amount"].mean().round(2).sort_values(ascending=False)
    print("Mean amount per city:")
    print(per_city.to_string())


if __name__ == "__main__":
    main()
