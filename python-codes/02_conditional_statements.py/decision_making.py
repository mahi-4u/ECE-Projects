#Author:mahesh
# ==========================================================
# Python Conditional Statements
# Covers:
# 1. Simple if
# 2. if-else
# 3. if-elif-else
# 4. Nested if
# 5. Short-hand if
# ==========================================================

print("========================================")
print("   PYTHON CONDITIONAL STATEMENTS")
print("========================================")

# ----------------------------------------------------------
# 1. Simple if
# ----------------------------------------------------------
print("\n1. Simple if Statement")

num = int(input("Enter a number: "))

if num > 0:
    print("The number is positive.")

# ----------------------------------------------------------
# 2. if-else
# ----------------------------------------------------------
print("\n2. if-else Statement")

num = int(input("Enter another number: "))

if num % 2 == 0:
    print("The number is even.")
else:
    print("The number is odd.")

# ----------------------------------------------------------
# 3. if-elif-else
# ----------------------------------------------------------
print("\n3. if-elif-else Statement")

marks = int(input("Enter your marks: "))

if marks >= 90:
    print("Grade: A")
elif marks >= 75:
    print("Grade: B")
elif marks >= 60:
    print("Grade: C")
else:
    print("Grade: D")

# ----------------------------------------------------------
# 4. Nested if
# ----------------------------------------------------------
print("\n4. Nested if Statement")

age = int(input("Enter your age: "))

if age >= 18:
    if age >= 21:
        print("You are eligible to vote and considered an adult.")
    else:
        print("You are eligible to vote.")
else:
    print("You are not eligible to vote.")

# ----------------------------------------------------------
# 5. Short-hand if
# ----------------------------------------------------------
print("\n5. Short-hand if Statement")

x = 10
if x > 5: print("x is greater than 5")

# Short-hand if-else
a = 15
b = 20
print("a is greater") if a > b else print("b is greater")

print("\n========================================")
print(" Conditional Statements Completed!")
print("========================================")
