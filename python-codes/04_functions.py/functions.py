#Author:mahesh
# ==========================================================
# Python Functions
# Covers:
# 1. Defining a function
# 2. Function with parameters
# 3. Function with return value
# 4. Default arguments
# 5. Keyword arguments
# 6. Variable-length arguments
# 7. Recursive function
# 8. Lambda function
# ==========================================================

print("========================================")
print("         PYTHON FUNCTIONS")
print("========================================")

# ----------------------------------------------------------
# 1. Simple Function
# ----------------------------------------------------------
def greet():
    print("Hello, Welcome to Python Functions!")

print("\n1. Simple Function")
greet()

# ----------------------------------------------------------
# 2. Function with Parameters
# ----------------------------------------------------------
def add(a, b):
    print("Sum =", a + b)

print("\n2. Function with Parameters")
add(10, 20)

# ----------------------------------------------------------
# 3. Function with Return Value
# ----------------------------------------------------------
def multiply(a, b):
    return a * b

print("\n3. Function with Return Value")
result = multiply(5, 4)
print("Product =", result)

# ----------------------------------------------------------
# 4. Default Arguments
# ----------------------------------------------------------
def introduce(name="Mahesh"):
    print("Hello,", name)

print("\n4. Default Arguments")
introduce()
introduce("Python")

# ----------------------------------------------------------
# 5. Keyword Arguments
# ----------------------------------------------------------
def student(name, age):
    print("Name:", name)
    print("Age:", age)

print("\n5. Keyword Arguments")
student(age=19, name="Mahesh")

# ----------------------------------------------------------
# 6. Variable-Length Arguments
# ----------------------------------------------------------
def total(*numbers):
    print("Sum =", sum(numbers))

print("\n6. Variable-Length Arguments")
total(10, 20, 30, 40)

# ----------------------------------------------------------
# 7. Recursive Function
# ----------------------------------------------------------
def factorial(n):
    if n == 0 or n == 1:
        return 1
    return n * factorial(n - 1)

print("\n7. Recursive Function")
print("Factorial of 5 =", factorial(5))

# ----------------------------------------------------------
# 8. Lambda Function
# ----------------------------------------------------------
square = lambda x: x * x

print("\n8. Lambda Function")
print("Square of 6 =", square(6))

print("\n========================================")
print(" Functions Demonstration Completed!")
print("========================================")
