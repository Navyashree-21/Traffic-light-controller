# 🚦 FSM-Based Traffic Light Controller (2-Road Intersection)

This project implements a **Finite State Machine (FSM) based traffic light controller** for a **2-road intersection** using **Verilog HDL**.  
The design follows a **modular RTL architecture** and supports **real-time operation**, **emergency vehicle priority**, and **FPGA-ready clock division**.


## ✨ Features

- ✔ FSM-based control (Moore machine)
- ✔ Two-road traffic intersection
- ✔ Counter-based timing (no delays, synthesizable)
- ✔ Emergency vehicle override for both roads
- ✔ Priority handling during simultaneous emergencies
- ✔ Clock divider (50 MHz → 1 Hz)
- ✔ Modular and scalable RTL design
- ✔ Verified using Vivado simulation and testbench


## 🧠 Design Overview

The controller operates in **four FSM states**:

| State | Road A | Road B |
|------|--------|--------|
| S0 | Green | Red |
| S1 | Yellow | Red |
| S2 | Red | Green |
| S3 | Red | Yellow |

State transitions are controlled by **timer expiry signals**:
- `time1` → Green duration (e.g., 30 seconds)
- `time2` → Yellow duration (e.g., 3 seconds)

## 🧩 Architecture

The design is divided into independent modules:

## 🚨 Emergency Vehicle Handling

- Two emergency inputs are supported:
  - `emergency_A`
  - `emergency_B`
- During emergency:
  - Normal timing is overridden
  - Priority road is forced to **GREEN**
- Priority rule:
  - Road A has higher priority if both emergencies occur simultaneously
- Normal operation resumes after emergency clears

## ⏱️ Clock Handling

- FPGA input clock: **50 MHz**
- A **counter-based clock divider** generates a **1 Hz clock**
- FSM and timer operate on the 1 Hz clock for real-time behavior
- Divider value can be scaled down during simulation for faster verification

## 🧪 Verification

- A dedicated **testbench** generates:
  - Clock
  - Reset
  - Emergency scenarios
- Verified using **Vivado waveform simulation**
- Confirmed:
  - Correct state transitions
  - No overlapping green signals
  - Proper emergency preemption and recovery

## 🛠 Tools Used

- Verilog HDL
- Vivado Simulator
- FPGA-friendly synthesizable RTL

