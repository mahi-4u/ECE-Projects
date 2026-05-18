# File Handling in Python

## Introduction

File handling is used to store data permanently in files. It allows programs to create, read, update, and append data to files.

Unlike variables, which lose data when the program ends, files preserve data for future use.

---

## Why This Topic Is Important

File handling is essential for:

- Saving data permanently
- Reading configuration files
- Storing reports and logs
- Managing student records
- Processing text files

---

## Types / Syntax

### Opening a File

```python
file = open("sample.txt", "r")
```

### Using `with` Statement (Recommended)

```python
with open("sample.txt", "r") as file:
    content = file.read()
```

### Common File Modes

| Mode | Description |
|------|------|
| `r` | Read |
| `w` | Write (creates or overwrites) |
| `a` | Append |
| `x` | Create a new file |
| `rb` | Read binary |
| `wb` | Write binary |

---

## Topics Covered

- Opening files
- Writing data
- Reading data
- Appending data
- File modes
- `with` statement
- Checking file existence

---

## Where File Handling Is Used

- Student record systems
- Saving application data
- Log files
- Configuration files
- Report generation

---

## Problems Demonstrated in the Code

### `file_handling.py`
Demonstrates writing, reading, appending, and checking files.

### `student_records.py`
Stores and displays student information using text files.

---

## Learning Outcomes

After completing this folder, you will understand:

- How to open and close files
- How to read, write, and append data
- Different file modes
- Why `with open()` is preferred
- Real-world uses of file handling

---

## Author

**Mahesh**
