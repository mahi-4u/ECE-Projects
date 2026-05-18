#Author:mahesh
'''this file consists of basic python programming elements'''
# ==========================================================
# Python Basics Program
# Covers:
# 1. Hello World
# 2. Input and Output
# 3. Operators
# 4. Type Conversion
# ==========================================================

print("========================================")
print("        PYTHON BASICS PROGRAM")
print("========================================")

# ----------------------------------------------------------
# 1. Hello World (this is the hello world program in python)
# ----------------------------------------------------------
print("\n1. Hello World")
print("Hello, World!")

# ----------------------------------------------------------
# 2. Input and Output
# ----------------------------------------------------------
print("\n2. Input and Output")
#taking input from user and displaying the input
name = input("Enter your name: ")
age = int(input("Enter your age: "))

print("Your name is:", name)
print("Your age is:", age)

# ----------------------------------------------------------
# 3. Operators
# ----------------------------------------------------------
print("\n3. Operators")
#here inputs are fixed or we can take input from user also
a = 10
b = 3

print("a =", a)
print("b =", b)

# Arithmetic Operators
print("\nArithmetic Operators")
print("a + b =", a + b)
print("a - b =", a - b)
print("a * b =", a * b)
print("a / b =", a / b)
print("a // b =", a // b)
print("a % b =", a % b)
print("a  b =", a  b)

# Comparison Operators
print("\nComparison Operators")
print("a > b :", a > b)
print("a < b :", a < b)
print("a == b:", a == b)
print("a != b:", a != b)

# Logical Operators
print("\nLogical Operators")
x = True
y = False

print("x and y =", x and y)
print("x or y  =", x or y)
print("not x   =", not x)

# Assignment Operators
print("\nAssignment Operators")
c = 5
print("Initial c =", c)

c += 2
print("After c += 2 :", c)

c *= 3
print("After c *= 3 :", c)

# ----------------------------------------------------------
# 4. Type Conversion
# ----------------------------------------------------------
print("\n4. Type Conversion")

num_str = "100"
print("String value:", num_str)
print("Type:", type(num_str))

num_int = int(num_str)
print("Converted to integer:", num_int)
print("Type:", type(num_int))

num_float = float(num_str)
print("Converted to float:", num_float)
print("Type:", type(num_float))

number = 25
number_str = str(number)
print("Integer converted to string:", number_str)
print("Type:", type(number_str))

print("\n========================================")
print(" Python Basics Program Completed!")
print("========================================")
