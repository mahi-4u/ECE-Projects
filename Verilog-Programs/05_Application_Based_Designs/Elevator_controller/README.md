# Elevator Controller Design in Verilog

## Overview

This project implements a basic elevator controller using Verilog HDL. The design is based on a finite state machine (FSM) and demonstrates the progression from a simple single-request system to a more advanced multi-request controller.

---

## Project Structure

* version_1.v : Basic elevator controller (single request)
* version_2.v : Enhanced controller (multiple requests)

---

## Version 1: Basic Design

### Description

The initial design (elevator_1) supports only one request at a time. It uses a simple FSM to control elevator movement and door operation.

### FSM States

* IDLE
* MOVE
* DOOR

### Features

* Accepts a single target floor input
* Moves toward the target floor step-by-step
* Opens the door when the destination is reached
* Uses a counter for timing control

### Limitations

* No support for multiple requests
* No request storage
* Limited scalability

---

## Version 2: Enhanced Design

### Description

The improved version (elevator_2) supports multiple floor requests and introduces better control logic and state separation.

### FSM States

* IDLE
* UP
* DOWN
* DOOR

### Features

* Handles multiple requests using a request register
* Stores incoming requests using bitwise logic
* Determines direction based on pending requests
* Services requests sequentially
* Clears request after servicing

### Key Logic Improvements

Request storage:
req <= req | req_in;

Check current floor request:
if (req[floor])

Clear request after servicing:
req[floor] <= 0;

Separate movement states:
UP and DOWN instead of a single MOVE state

---

## Comparison

## Feature                Version 1    Version 2

Single request        Yes          Yes
Multiple requests     No           Yes
Request memory        No           Yes
FSM states            3            4
Direction handling    Basic        Improved

---

## Concepts Used

* Finite State Machine (FSM)
* Sequential and combinational logic
* Register-based request storage
* Counter-based timing control

---

## Learning Outcomes

* Designed FSM-based control logic
* Improved system from single to multiple request handling
* Learned how to manage state transitions effectively
* Built a more scalable digital design

---

## Future Work

* Add priority-based scheduling
* Extend design to more floors
* Handle simultaneous requests
* Add safety features like door sensors

---

## Author

Mahesh

