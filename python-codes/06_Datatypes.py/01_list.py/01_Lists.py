# ==========================================================
# Python Lists
# Covers:
# 1. Creating lists
# 2. Accessing elements
# 3. Slicing
# 4. Updating elements
# 5. Adding elements
# 6. Removing elements
# 7. List methods
# 8. List traversal
# ==========================================================

print("========================================")
print("           PYTHON LISTS")
print("========================================")

# ----------------------------------------------------------
# 1. Creating Lists
# ----------------------------------------------------------
numbers = [10, 20, 30, 40, 50]
print("\n1. Creating Lists")
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
# 4. Updating Elements
# ----------------------------------------------------------
print("\n4. Updating Elements")
numbers[1] = 25
print(numbers)

# ----------------------------------------------------------
# 5. Adding Elements
# ----------------------------------------------------------
print("\n5. Adding Elements")
numbers.append(60)
print("After append:", numbers)

numbers.insert(2, 15)
print("After insert:", numbers)

numbers.extend([70, 80])
print("After extend:", numbers)

# ----------------------------------------------------------
# 6. Removing Elements
# ----------------------------------------------------------
print("\n6. Removing Elements")
numbers.remove(25)
print("After remove:", numbers)

popped = numbers.pop()
print("Popped element:", popped)
print("After pop:", numbers)

# ----------------------------------------------------------
# 7. List Methods
# ----------------------------------------------------------
print("\n7. List Methods")
print("Length:", len(numbers))
print("Maximum:", max(numbers))
print("Minimum:", min(numbers))
print("Sum:", sum(numbers))

numbers.sort()
print("Sorted:", numbers)

numbers.reverse()
print("Reversed:", numbers)

# ----------------------------------------------------------
# 8. Traversing a List
# ----------------------------------------------------------
print("\n8. Traversing a List")
for item in numbers:
    print(item)

print("\n========================================")
print(" Lists Demonstration Completed!")
print("========================================")
