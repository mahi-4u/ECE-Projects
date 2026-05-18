# Python Basics

Python is a high-level, interpreted, and beginner-friendly programming language. It is widely used in web development, automation, data science, artificial intelligence, and software development.

---

## Why Python is Easy to Learn

Compared to languages like C, C++, and Java, Python is easier because:

- Simple and readable syntax
- No need to declare data types explicitly
- Fewer lines of code
- Built-in functions and libraries
- Easy to debug and maintain

### Example

#### C Program
```c
#include <stdio.h>
int main() {
    printf("Hello World");
    return 0;
}
```

#### Python Program
```python
print("Hello World")
```

---

## Features of Python

- High-level language
- Interpreted language
- Object-oriented
- Dynamically typed
- Cross-platform
- Open source
- Large standard library

---

## How to Run a Python Program

### 1. Install Python
Download from: https://www.python.org

### 2. Create a File
Create a file named `basics.py`

### 3. Write Code
```python
print("Hello World")
```

### 4. Run the Program
```bash
python basics.py
```

or

```bash
python3 basics.py
```

---

## Comments in Python

Comments are used to explain code. Python ignores comments during execution.

### Single-Line Comment
```python
# This is a comment
print("Hello")
```
```

### Multiple Single-Line Comments
```python
# Line 1
# Line 2
# Line 3
```

### Multi-Line String (Used as Comment)
```python
"""
This is a multi-line comment.
Used to explain code.
"""
```

## Topics Covered in `basics.py`

- Hello World
- Input and Output
- Operators
- Type Conversion

---

## Hello World
```python
print("Hello, World!")
```

---

## Input and Output
```python
name = input("Enter your name: ")
print("Hello", name)
```

---

## Operators in Python

### Arithmetic Operators
| Operator | Example | Result |
|--------|--------|--------|
| `+` | `5 + 3` | 8 |
| `-` | `5 - 3` | 2 |
| `*` | `5 * 3` | 15 |
| `/` | `5 / 2` | 2.5 |
| `//` | `5 // 2` | 2 |
| `%` | `5 % 2` | 1 |
| `**` | `5 ** 2` | 25 |

### Comparison Operators
- `==` Equal to
- `!=` Not equal to
- `>` Greater than
- `<` Less than
- `>=` Greater than or equal to
- `<=` Less than or equal to

### Logical Operators
- `and`
- `or`
- `not`

### Assignment Operators
- `=`
- `+=`
- `-=`
- `*=`
- `/=`

---

## Type Conversion

Type conversion changes one data type into another.

```python
num = "25"

x = int(num)      # String to integer
y = float(num)    # String to float
z = str(x)        # Integer to string
```

### Common Conversion Functions

- `int()`
- `float()`
- `str()`
- `bool()`

---

## Data Types in Python

- `int`
- `float`
- `str`
- `bool`
- `list`
- `tuple`
- `set`
- `dict`

---

## Check Data Type

```python
x = 10
print(type(x))   # <class 'int'>
```

## Learning Outcome

After completing this folder, you will understand:

- What Python is and why it is popular
- How to write and run Python programs
- How to use comments
- How to take user input
- How operators work
- How type conversion works
- How to check data types
```
## Author:mahesh
