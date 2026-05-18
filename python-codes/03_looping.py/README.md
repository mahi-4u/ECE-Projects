# Loops in Python

## Introduction

Loops are used to execute a block of code repeatedly. They help automate repetitive tasks and make programs shorter, cleaner, and more efficient.

Python provides two main types of loops:

- `for` loop
- `while` loop

Loops are one of the most important concepts in programming.

---

## Why This Topic Is Important

Loops are useful whenever we need to repeat a task multiple times.

Common use cases include:

- Printing numbers in a sequence
- Calculating factorials
- Generating Fibonacci series
- Displaying multiplication tables
- Processing lists and strings
- Reading data from files
- Creating patterns

Without loops, we would have to write the same code repeatedly.

---

## Types / Syntax

### 1. `for` Loop

Used when the number of iterations is known.

```python
for i in range(1, 6):
    print(i)
```

### 2. `while` Loop

Used when a block should run until a condition becomes false.

```python
i = 1
while i <= 5:
    print(i)
    i += 1
```

### 3. Loop Control Statements

#### `break`
Terminates the loop immediately.

```python
for i in range(10):
    if i == 5:
        break
```

#### `continue`
Skips the current iteration.

```python
for i in range(5):
    if i == 2:
        continue
```

#### `pass`
Acts as a placeholder.

```python
for i in range(5):
    if i == 2:
        pass
```

### 4. Nested Loops

A loop inside another loop.

```python
for i in range(3):
    for j in range(3):
        print(i, j)
```

---

## Topics Covered

- `for` loop
- `while` loop
- `break`
- `continue`
- `pass`
- Nested loops

---

## Where Loops Are Used

- Printing numbers from 1 to `n`
- Finding factorial of a number
- Generating Fibonacci series
- Printing multiplication tables
- Summing numbers
- Reversing digits of a number
- Pattern printing
- Traversing strings and lists
- Reading and processing files

---

## Problems Demonstrated in the Code

### 1. Printing Numbers Using `for` Loop
Shows how to repeat a task a fixed number of times.

### 2. Printing Numbers Using `while` Loop
Demonstrates repetition based on a condition.

### 3. Using `break`
Stops the loop when a condition is met.

### 4. Using `continue`
Skips specific iterations.

### 5. Using `pass`
Demonstrates a placeholder statement.

### 6. Nested Loops
Shows how to use one loop inside another.

---

## Learning Outcomes

After completing this folder, you will understand:

- What loops are and why they are important
- Difference between `for` and `while` loops
- How to use `break`, `continue`, and `pass`
- How nested loops work
- How loops solve repetitive programming problems

---
**#Author:mahesh**
## Author

**Mahesh**
