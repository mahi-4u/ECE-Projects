# ==========================================================
# Python File Handling
# Covers:
# 1. Creating and writing to a file
# 2. Reading a file
# 3. Appending data to a file
# ==========================================================

print("========================================")
print("       PYTHON FILE HANDLING")
print("========================================")

# ---------------------------------------------------------
# 1. Create a text file and write student details
# ---------------------------------------------------------

file = open("student.txt", "w")

name = input("\nEnter student name: ")
roll = input("Enter roll number: ")
branch = input("Enter branch: ")

file.write("Student Details\n")
file.write("----------------\n")
file.write("Name: " + name + "\n")
file.write("Roll Number: " + roll + "\n")
file.write("Branch: " + branch + "\n")

file.close()

print("\nStudent details written to student.txt successfully.")

# ---------------------------------------------------------
# 2. Read and display the contents of the file
# ---------------------------------------------------------

file = open("student.txt", "r")

content = file.read()

print("\nContents of student.txt:\n")
print(content)

file.close()

# ---------------------------------------------------------
# 3. Append new data to the file
# ---------------------------------------------------------

file = open("student.txt", "a")

college = input("Enter college name to append: ")

file.write("College: " + college + "\n")

file.close()

print("\nCollege name appended successfully.")

# ---------------------------------------------------------
# 4. Read updated contents
# ---------------------------------------------------------

file = open("student.txt", "r")

content = file.read()

print("\nUpdated Contents of student.txt:\n")
print(content)

file.close()

print("========================================")
print(" File Handling Demonstration Completed!")
print("========================================")
