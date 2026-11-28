"""P3.3 – simulate response times with a few slow outliers and print the statistics.

Usage:
    python tools/p3_stats.py                 # 10 outliers (the course default)
    python tools/p3_stats.py --outliers 60   # try more outliers
    python tools/p3_stats.py --plot notes/p3-histogram.png
"""
import argparse
import random

import pandas as pd


def simulate(outliers, total=1000, seed=7):
    random.seed(seed)
    normal = [random.gauss(300, 40) for _ in range(total - outliers)]
    slow = [random.uniform(1500, 3000) for _ in range(outliers)]
    return pd.Series(normal + slow)


def stats(s):
    return {
        "avg": s.mean(),
        "median": s.median(),
        "p90": s.quantile(0.90),
        "p95": s.quantile(0.95),
        "p99": s.quantile(0.99),
        "max": s.max(),
    }


def main():
    parser = argparse.ArgumentParser(description="Response-time statistics demo.")
    parser.add_argument("--outliers", type=int, default=10, help="how many of the 1,000 are slow (default 10)")
    parser.add_argument("--plot", help="save a histogram to this PNG file")
    args = parser.parse_args()

    s = simulate(args.outliers)
    print(f"1,000 response times, {args.outliers} slow outliers")
    for name, value in stats(s).items():
        print(f"{name:>6}: {value:8.1f} ms")

    if args.plot:
        import matplotlib
        matplotlib.use("Agg")  # no window needed, just write the file
        import matplotlib.pyplot as plt

        st = stats(s)
        fig, ax = plt.subplots(figsize=(9, 4.5))
        ax.hist(s, bins=60, color="#4C78A8")
        for name, color in [("median", "#2CA02C"), ("avg", "#FF7F0E"), ("p95", "#D62728")]:
            ax.axvline(st[name], color=color, linestyle="--", label=f"{name} = {st[name]:.0f} ms")
        ax.set_title(f"Simulated response times (1,000 requests, {args.outliers} slow outliers)")
        ax.set_xlabel("Response time (ms)")
        ax.set_ylabel("Number of requests")
        ax.legend()
        fig.tight_layout()
        fig.savefig(args.plot, dpi=120)
        print(f"Histogram saved to {args.plot}")


if __name__ == "__main__":
    main()
