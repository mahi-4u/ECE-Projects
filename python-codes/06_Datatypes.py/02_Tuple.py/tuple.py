# ==========================================================
# Python Tuples
# Covers:
# 1. Creating tuples
# 2. Accessing elements
# 3. Slicing
# 4. Tuple methods
# 5. Packing and unpacking
# 6. Traversing a tuple
# ==========================================================

print("========================================")
print("           PYTHON TUPLES")
print("========================================")

# ----------------------------------------------------------
# 1. Creating Tuples
# ----------------------------------------------------------
numbers = (10, 20, 30, 40, 50)
print("\n1. Creating Tuples")
print(numbers)

# ----------------------------------------------------------
# 2. Accessing Elements
# ----------------------------------------------------------
print("\n2. Accessing Elements")
print("First element:", numbers[0])
print("Last element:", numbers[-1])

# ----------------------------------------------------------
# 3. Slicing
# ----------------------------------------------------------
print("\n3. Slicing")
print("First three elements:", numbers[:3])
print("Last two elements:", numbers[-2:])

# ----------------------------------------------------------
# 4. Tuple Methods
# ----------------------------------------------------------
data = (10, 20, 30, 20, 40, 20)

print("\n4. Tuple Methods")
print("Count of 20:", data.count(20))
print("Index of 30:", data.index(30))

# ----------------------------------------------------------
# 5. Packing and Unpacking
# ----------------------------------------------------------
print("\n5. Packing and Unpacking")

student = ("Mahesh", 19, "ECE")  # Packing
name, age, branch = student      # Unpacking

print("Name:", name)
print("Age:", age)
print("Branch:", branch)

# ----------------------------------------------------------
# 6. Traversing a Tuple
# ----------------------------------------------------------
print("\n6. Traversing a Tuple")
for item in numbers:
    print(item)

print("\n========================================")
print(" Tuples Demonstration Completed!")
print("========================================")
