# ==========================================================
# Python Strings
# Covers:
# 1. Creating strings
# 2. Indexing
# 3. Slicing
# 4. String methods
# 5. Membership operators
# 6. String formatting
# 7. Escape characters
# ==========================================================

print("========================================")
print("          PYTHON STRINGS")
print("========================================")

# ----------------------------------------------------------
# 1. Creating Strings
# ----------------------------------------------------------
name = "Mahesh"
print("\n1. Creating Strings")
print(name)

# ----------------------------------------------------------
# 2. Indexing
# ----------------------------------------------------------
print("\n2. Indexing")
print("First character:", name[0])
print("Last character:", name[-1])

# ----------------------------------------------------------
# 3. Slicing
# ----------------------------------------------------------
print("\n3. Slicing")
print("First 3 characters:", name[:3])
print("Last 3 characters:", name[-3:])

# ----------------------------------------------------------
# 4. String Methods
# ----------------------------------------------------------
text = "  python programming  "

print("\n4. String Methods")
print("Upper:", text.upper())
print("Lower:", text.lower())
print("Title:", text.title())
print("Strip:", text.strip())
print("Replace:", text.replace("python", "Python"))
print("Count of 'm':", text.count("m"))

# ----------------------------------------------------------
# 5. Membership Operators
# ----------------------------------------------------------
print("\n5. Membership Operators")
print("'python' in text:", "python" in text)
print("'java' not in text:", "java" not in text)

# ----------------------------------------------------------
# 6. String Formatting
# ----------------------------------------------------------
print("\n6. String Formatting")
language = "Python"
version = 3.13
print(f"{language} version is {version}")

# ----------------------------------------------------------
# 7. Escape Characters
# ----------------------------------------------------------
print("\n7. Escape Characters")
print("Hello\nWorld")
print("Python\tProgramming")
print("He said, \"Python is easy!\"")

print("\n========================================")
print(" Strings Demonstration Completed!")
print("========================================")
