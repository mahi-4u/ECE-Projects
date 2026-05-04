# Vending Machine Design in Verilog

## Overview

This project implements a simple vending machine using Verilog HDL. The design is based on a finite state machine (FSM) and models a system that accepts coins of Rs.5 and Rs.10 to dispense a product (chocolate) costing Rs.15.

---

## Description

The vending machine operates by transitioning through different states based on the inserted coins. Once the total amount reaches or exceeds Rs.15, the machine dispenses a chocolate and optionally returns change.

---

## FSM States

* s0  : Initial state (Rs.0)
* s5  : Rs.5 inserted
* s10 : Rs.10 inserted
* s15 : Rs.15 or more (product dispensing state)

---

## Features

* Accepts two types of coins:

  * Rs.5  (coin = 2'b01)
  * Rs.10 (coin = 2'b10)
* Accumulates total amount using state transitions
* Dispenses chocolate when total reaches Rs.15
* Returns change when Rs.20 is inserted
* Uses pulse-based output for accurate dispensing

---

## Working Logic

### State Transitions

* s0 → s5  when Rs.5 is inserted
* s0 → s10 when Rs.10 is inserted
* s5 → s10 when another Rs.5 is inserted
* s5 → s15 when Rs.10 is inserted
* s10 → s15 when Rs.5 or Rs.10 is inserted
* s15 → s0 after dispensing

---

### Output Behavior

* Chocolate is dispensed when system enters state s15
* Change is returned only in the case of excess payment

Example:

* Rs.10 + Rs.10 = Rs.20

  * Chocolate is dispensed
  * Rs.5 is returned as change

---

## Key Logic Implementation

State register:
ps <= ns;

State transition based on coin input:
if(coin == 2'b01) or if(coin == 2'b10)

Product dispensing condition:
if (ns == s15 && ps != s15)

Change handling:
if (ps == s10 && coin == 2'b10)

---

## Concepts Used

* Finite State Machine (FSM)
* Sequential and combinational logic
* State-based output generation
* Conditional output control

---

## Learning Outcomes

* Designed FSM for a real-world application
* Understood state-based accumulation logic
* Implemented output pulse generation
* Learned how to handle excess input (change return)

---

## Future Work

* Support more coin denominations
* Add multiple product selection
* Display total amount using output signals
* Extend to a fully automated vending system

---

## Author

Mahesh

