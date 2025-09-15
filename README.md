# Non-Overlapping Sequence Detector FSM (1011) in Verilog

This repository contains the design and verification of a **Finite State Machine (FSM)** implemented in Verilog.  
The FSM detects the **binary sequence `1011`** in a serial input stream.  

It is designed as a **Moore FSM** where the output depends only on the current state.  
The detector is **non-overlapping**, meaning that once the sequence is detected, it resets appropriately to **avoid unwanted repeated or overlapping detections**.

---

## 📂 Repository Contents
- **`seq_detector.v`** → RTL design of the sequence detector FSM.  
- **`seq_detector_tb.v`** → Testbench to verify the FSM behavior with different input streams.  

---

## ⚙️ Features
- Detects the binary sequence **`1011`** in a serial input.  
- **Moore FSM** design (output depends only on the state).  
- **Non-overlapping detection** → avoids multiple detections from overlapping bits.  
- **Reset functionality** to restart the FSM at any time.  
- Output `seq_out` goes **HIGH (1)** only when the complete sequence is detected.  

---

## 🧩 FSM Design

### States
- **S0** → Initial/Reset state.  
- **S1** → Sequence seen: `1`  
- **S2** → Sequence seen: `10`  
- **S3** → Sequence seen: `101`  
- **S4** → Sequence detected: `1011` ✅  

### Transitions
- From **S0** → go to **S1** on input `1`.  
- From **S1** → go to **S2** on input `0`.  
- From **S2** → go to **S3** on input `1`.  
- From **S3** → go to **S4** on input `1`.  
- From **S4** → reset to **S0** or **S1** depending on input (non-overlapping behavior).  

### Output
- `seq_out = 1` **only when FSM is in state S4** (sequence `1011` detected).  
- Otherwise, `seq_out = 0`.  

---

## ▶️ How to Run the Simulation

### Using Icarus Verilog
1. Compile the design and testbench:
   ```sh
   iverilog -o seq_detector_tb seq_detector.v seq_detector_tb.v
