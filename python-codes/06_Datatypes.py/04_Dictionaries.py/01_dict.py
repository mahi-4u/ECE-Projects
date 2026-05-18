# ==========================================================
# Python Dictionaries
# Covers:
# 1. Creating dictionaries
# 2. Accessing values
# 3. Adding and updating items
# 4. Removing items
# 5. Dictionary methods
# 6. Traversing a dictionary
# ==========================================================

print("========================================")
print("        PYTHON DICTIONARIES")
print("========================================")

# ----------------------------------------------------------
# 1. Creating Dictionaries
# ----------------------------------------------------------
student = {
    "name": "Mahesh",
    "age": 19,
    "branch": "ECE"
}

print("\n1. Creating Dictionaries")
print(student)

# ----------------------------------------------------------
# 2. Accessing Values
# ----------------------------------------------------------
print("\n2. Accessing Values")
print("Name:", student["name"])
print("Age:", student.get("age"))

# ----------------------------------------------------------
# 3. Adding and Updating Items
# ----------------------------------------------------------
print("\n3. Adding and Updating Items")

student["college"] = "IIIT RK Valley"   # Add new key-value pair
student["age"] = 20                     # Update existing value

print(student)

# ----------------------------------------------------------
# 4. Removing Items
# ----------------------------------------------------------
print("\n4. Removing Items")

removed_age = student.pop("age")
print("Removed age:", removed_age)

student.popitem()   # Removes last inserted item
print("After popitem():", student)

# ----------------------------------------------------------
# 5. Dictionary Methods
# ----------------------------------------------------------
print("\n5. Dictionary Methods")

print("Keys:", student.keys())
print("Values:", student.values())
print("Items:", student.items())

# ----------------------------------------------------------
# 6. Traversing a Dictionary
# ----------------------------------------------------------
print("\n6. Traversing a Dictionary")

for key, value in student.items():
    print(key, ":", value)

print("\n========================================")
print(" Dictionaries Demonstration Completed!")
print("========================================")
