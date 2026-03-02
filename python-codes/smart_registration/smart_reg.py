import csv
import re
import os
import uuid

FILE_NAME = "participants.csv"

# -------------------------
# Email Validation Function
# -------------------------
def is_valid_email(email):
    pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
    return re.match(pattern, email)


# -------------------------
# Generate Unique ID
# -------------------------
def generate_id():
    return str(uuid.uuid4())[:8]


# -------------------------
# Ensure File Exists with Header
# -------------------------
def initialize_file():
    if not os.path.exists(FILE_NAME):
        with open(FILE_NAME, "w", newline="") as file:
            writer = csv.writer(file)
            writer.writerow(["ID", "Name", "Email"])


# -------------------------
# Register Participant
# -------------------------
def register_participant():
    name = input("Enter Name: ").strip()
    email = input("Enter Email: ").strip().lower()

    if not is_valid_email(email):
        print("❌ Invalid email format!")
        return

    initialize_file()

    # Check duplicate email
    with open(FILE_NAME, "r") as file:
        reader = csv.reader(file)
        next(reader)  # Skip header
        for row in reader:
            if len(row) >= 3 and email == row[2]:
                print("⚠ Participant already registered with this email!")
                return

    participant_id = generate_id()

    with open(FILE_NAME, "a", newline="") as file:
        writer = csv.writer(file)
        writer.writerow([participant_id, name, email])

    print("✅ Registration Successful!")
    print("Your Participant ID:", participant_id)


# -------------------------
# View Participants
# -------------------------
def view_participants():
    if not os.path.exists(FILE_NAME):
        print("No registrations yet.")
        return

    with open(FILE_NAME, "r") as file:
        reader = csv.reader(file)
        for row in reader:
            print(row)


# -------------------------
# Search by ID
# -------------------------
def search_participant():
    search_id = input("Enter Participant ID: ").strip()

    if not os.path.exists(FILE_NAME):
        print("No data available.")
        return

    with open(FILE_NAME, "r") as file:
        reader = csv.reader(file)
        next(reader)
        for row in reader:
            if search_id == row[0]:
                print("✅ Participant Found:", row)
                return

    print("❌ Participant not found.")


# -------------------------
# Main Menu
# -------------------------
def main():
    while True:
        print("\n--- Smart Event Registration System ---")
        print("1. Register")
        print("2. View Participants")
        print("3. Search by ID")
        print("4. Exit")

        choice = input("Choose option: ").strip()

        if choice == "1":
            register_participant()
        elif choice == "2":
            view_participants()
        elif choice == "3":
            search_participant()
        elif choice == "4":
            print("Exiting system...")
            break
        else:
            print("Invalid choice. Try again.")


if __name__ == "__main__":
    main()