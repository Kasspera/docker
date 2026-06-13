import csv
import random
import os
import sys

NUM_ROWS = 50

COLUMNS = ["product", "price", "quantity", "category"]

def generate_row():

    return {
        "product": random.choice(["bread", "milk", "coffee", "apple", "cheese"]),
        "price": round(random.uniform(50, 500), 2),
        "quantity": random.randint(1, 30),
        "category": random.choice(["food", "drink", "snack"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

