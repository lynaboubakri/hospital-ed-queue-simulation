# Hospital Emergency Department Queuing System Simulation

## CMA6134 – Simulation and Modelling Assignment

This project simulates a Hospital Emergency Department queuing system using FreeMat. The simulation evaluates the performance of a baseline system with **2 doctors** and an improved system with **3 doctors**.

---

# Software Requirements

* FreeMat v4.2

---

# How to Run the Simulation

1. Open FreeMat.
2. Open the project folder containing all `.m` files.
3. In the FreeMat Command Window, type:

```matlab
m4_main
```

4. The simulation will automatically:

   * Generate patient arrivals.
   * Run the baseline simulation (2 doctors).
   * Run the improvement simulation (3 doctors).
   * Calculate performance metrics.
   * Display a comparison table.
   * Save the simulation results.

---

# Project File Structure

| File                     | Description                                                                                               |
| ------------------------ | --------------------------------------------------------------------------------------------------------- |
| `m1_arrivals.m`          | Generates patient arrival times.                                                                          |
| `m2_service_queue.m`     | Simulates the baseline system with 2 doctors.                                                             |
| `m3_metrics.m`           | Calculates average waiting time, queue length, doctor utilization, and total patients served.             |
| `m4_main.m`              | Main controller that executes the complete simulation, stores results, and displays the comparison table. |
| `m4_service_queue_3dr.m` | Simulates the improved system with 3 doctors.                                                             |

---

# Input Parameters

| Parameter            | Value            |
| -------------------- | ---------------- |
| Simulation Duration  | 480 minutes      |
| Arrival Rate         | 10 patients/hour |
| Average Service Time | 15 minutes       |
| Baseline Scenario    | 2 Doctors        |
| Improvement Scenario | 3 Doctors        |

---

# Performance Metrics

The simulation computes the following performance metrics:

* Average Waiting Time
* Average Queue Length
* Doctor Utilization
* Total Patients Served

---

# Output

Running `m4_main` will:

* Display the simulation results.
* Generate:

  * Waiting Time Distribution graph
  * Queue Length Over Time graph
* Display a comparison table between the baseline and improvement scenarios.
* Automatically generate:

  * `baseline_results.mat`
  * `improved_results.mat`

---

# Authors

CAM6134 Group Assignment

Member 1 – Patient Arrival Generator

Member 2 – Service & Queue System

Member 3 – Performance Metrics

Member 4 – Main Simulation Controller, Improvement Scenario, Results Comparison, and README
