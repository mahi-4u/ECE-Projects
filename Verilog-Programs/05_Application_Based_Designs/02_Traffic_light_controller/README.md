# Traffic Light Controller Design in Verilog

## Overview

This project implements a two-junction traffic light controller using Verilog HDL. The design is based on a finite state machine (FSM) and demonstrates the progression from a simple signal-based controller to a more realistic delay-based controller.

---

## Project Structure

* version_1 : Traffic controller without delay (input-based)
* version_2 : Traffic controller with delay using counter

---

## Version 1: Basic Design (Without Delay)

### Description

This version controls traffic flow based on an external input signal representing vehicle presence on the country road. It does not include timing delays and transitions immediately between states.

### FSM States

* a
* b
* c
* d
* e

### Features

* Input-based control using signal `x`
* Highway gets priority by default
* Country road is served only when request is present
* Immediate state transitions (no delay)
* Simple FSM implementation

### Limitations

* No timing control for traffic lights
* Unrealistic behavior for real-world usage
* Sudden transitions may cause unsafe conditions

---

## Version 2: Enhanced Design (With Delay)

### Description

This version improves the controller by introducing delays using a counter. It models real-world traffic light timing more accurately.

### FSM States

* a (Highway Green)
* b (Highway Yellow)
* c (Country Green)
* d (Country Yellow)

### Features

* Uses counter to introduce timing delays
* Fixed duration for each light:

  * Green: longer duration
  * Yellow: shorter duration
* Automatic state transitions based on timing
* More realistic traffic behavior

### Key Logic Improvements

Counter-based delay:
counter <= counter + 1;

State transition with timing:
(counter == 30) or (counter == 5)

Counter reset on state change:
if(ps != ns)
counter <= 0;

---

## Comparison

| Feature             | Version 1 | Version 2 |
| ------------------- | --------- | --------- |
| Input-based control | Yes       | No        |
| Delay mechanism     | No        | Yes       |
| Counter usage       | No        | Yes       |
| FSM states          | 5         | 4         |
| Real-world modeling | Low       | High      |
| Transition type     | Immediate | Timed     |

---

## Concepts Used

* Finite State Machine (FSM)
* Sequential and combinational logic
* Counter-based timing
* State transition control

---

## Learning Outcomes

* Designed FSM for traffic control system
* Understood importance of timing in digital systems
* Improved design from input-based to time-based control
* Learned how to model real-world systems in hardware

---

## Future Work

* Add sensor + timing hybrid model
* Implement adaptive traffic control
* Extend to multiple junctions
* Add pedestrian crossing logic

---

## Author

Mahesh

