# Finite State Machines (FSM)

## Overview

This folder contains Verilog HDL implementations of Finite State Machines (FSMs) using both Mealy and Moore models. FSMs are widely used in digital design to model systems that operate based on a sequence of states and inputs.

---

## What is an FSM?

A Finite State Machine (FSM) is a computational model used to design sequential logic systems. It consists of:

* A finite number of states
* State transitions based on inputs
* Outputs that depend on the current state and/or inputs

An FSM typically has:

* State register (stores current state)
* Next state logic
* Output logic

---

## Types of FSM

### Mealy Machine

In a Mealy machine, the output depends on:

* Current state
* Current input

This means outputs can change immediately with input changes.

### Moore Machine

In a Moore machine, the output depends only on:

* Current state

This makes outputs more stable but may introduce a delay of one clock cycle.

---

## Mealy vs Moore Comparison

| Feature           | Mealy Machine   | Moore Machine   |
| ----------------- | --------------- | --------------- |
| Output depends on | State and input | State only      |
| Output timing     | Immediate       | One clock delay |
| Number of states  | Usually fewer   | Usually more    |
| Output stability  | Less stable     | More stable     |

---

## Experiments Included

* Parity Checkers

  * Even Parity Checker
  * Odd Parity Checker

* Serial Adders

  * Mealy Serial Adder
  * Moore Serial Adder

* Sequence Detectors

  * Mealy Sequence Detector (110 - Overlapping / Non-overlapping)
  * Moore Sequence Detector (110 - Overlapping / Non-overlapping)

---

## Contents of Each Experiment

* Verilog source code
* Testbench code
* State diagram (where applicable)
* Short explanation of the design and working

---

## Summary

This collection demonstrates the practical implementation of FSM concepts using both Mealy and Moore models, helping in understanding their differences and applications in digital system design.

---

## Author

Mahesh
