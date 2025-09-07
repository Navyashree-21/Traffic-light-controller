# 🚦 Traffic Light Controller on FPGA (Verilog)

This project implements a **2-way traffic light controller** on FPGA using **FSM (Finite State Machine)** and a **clock divider** for real-time delays.  

## 🔹 Features
- North-South (NS) and East-West (EW) traffic lights
- States: Green → Yellow → Red with configurable durations
- Clock divider converts FPGA’s high-frequency clock (50 MHz) to 1 Hz
- FSM cycles through traffic light states every few seconds
- Synthesizable and FPGA-ready

## 🔹 State Machine
| State | NS Light | EW Light | Duration |
|-------|----------|----------|----------|
| S0    | Green    | Red      | 10 sec   |
| S1    | Yellow   | Red      | 3 sec    |
| S2    | Red      | Green    | 10 sec   |
| S3    | Red      | Yellow   | 3 sec    |

For simulation and synthesis
-use quartus prime/vivado with the help of FPGA(zedboard)
