# ==========================================================
# Python Sets
# Covers:
# 1. Creating sets
# 2. Adding elements
# 3. Removing elements
# 4. Set operations
# 5. Membership operators
# 6. Traversing a set
# ==========================================================

print("========================================")
print("            PYTHON SETS")
print("========================================")

# ----------------------------------------------------------
# 1. Creating Sets
# ----------------------------------------------------------
numbers = {10, 20, 30, 40, 50}
print("\n1. Creating Sets")
print(numbers)

# Sets automatically remove duplicates
duplicate_values = {10, 20, 20, 30, 30, 40}
print("Set removes duplicates:", duplicate_values)

# ----------------------------------------------------------
# 2. Adding Elements
# ----------------------------------------------------------
print("\n2. Adding Elements")
numbers.add(60)
print("After add:", numbers)

numbers.update([70, 80])
print("After update:", numbers)

# ----------------------------------------------------------
# 3. Removing Elements
# ----------------------------------------------------------
print("\n3. Removing Elements")
numbers.remove(20)
print("After remove:", numbers)

removed = numbers.pop()
print("Popped element:", removed)
print("After pop:", numbers)

# ----------------------------------------------------------
# 4. Set Operations
# ----------------------------------------------------------
print("\n4. Set Operations")

A = {1, 2, 3, 4}
B = {3, 4, 5, 6}

print("A =", A)
print("B =", B)

print("Union:", A | B)
print("Intersection:", A & B)
print("Difference (A - B):", A - B)
print("Symmetric Difference:", A ^ B)

# ----------------------------------------------------------
# 5. Membership Operators
# ----------------------------------------------------------
print("\n5. Membership Operators")
print("3 in A:", 3 in A)
print("7 not in A:", 7 not in A)

# ----------------------------------------------------------
# 6. Traversing a Set
# ----------------------------------------------------------
print("\n6. Traversing a Set")
for item in A:
    print(item)

print("\n========================================")
print(" Sets Demonstration Completed!")
print("========================================")
