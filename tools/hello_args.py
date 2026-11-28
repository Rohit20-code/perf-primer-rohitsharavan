"""Count the lines in a file given on the command line.

Usage:
    python tools/hello_args.py <file>
    python tools/hello_args.py notes/p3-sql.sql
"""
import argparse
import sys


def count_lines(path):
    with open(path, encoding="utf-8") as f:
        return sum(1 for _ in f)


def main():
    parser = argparse.ArgumentParser(description="Print how many lines a file has.")
    parser.add_argument("filename", help="path to the file to count")
    args = parser.parse_args()

    try:
        n = count_lines(args.filename)
    except FileNotFoundError:
        print(f"File not found: {args.filename}", file=sys.stderr)
        sys.exit(1)

    print(f"{args.filename} has {n} lines")


if __name__ == "__main__":
    main()
