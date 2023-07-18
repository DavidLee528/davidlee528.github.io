---
title: "Operating System Process Scheduling Algorithm Simulation System"
collection: projects
excerpt: "<img width=800 src='./projects_banner/2022-11-os_process_scheduling_simulator.jpg'>"
date: 2022-11-10
permalink: /projects/2022-11-os_process_scheduling_simulator
---

## Background

Operating systems manage computer resources and provide services for applications. [Process scheduling](https://www.geeksforgeeks.org/process-schedulers-in-operating-system/) is a key function of operating systems, which allocates CPU time to multiple processes. In this project, I present my experiments on four process scheduling algorithms: [FCFS](https://en.wikibooks.org/wiki/Operating_System_Design/Scheduling_Processes/FCFS), [SJF](https://en.wikipedia.org/wiki/Shortest_job_next), [HRRN](https://en.wikipedia.org/wiki/Highest_response_ratio_next), and [RR](https://en.wikipedia.org/wiki/Round-robin_scheduling). I use modern `C++` language to design and implement a process scheduling simulator that can **simulate the behavior and performance of these algorithms**. I also use `Python 3` language to **visualize the results of the simulation using Gantt charts**. Plus comparations and analysises of the results of different algorithms based on several metrics, such as throughput, turnaround time, waiting time, response time, and CPU utilization. 

## Involved Techonologies

- Operating System
- Process Scheduling Algorithm
  - FCFS: First Come First Serve
  - SJF: Short Job FIrst
  - HRRN: High Response Ratio Next
  - RR: Round Robin
- Unix Philosophy
  - **Simulator** (`ELF` written by `C++`) captures *user input* and outputs *simulation metadata*.
  - **Visualizer** (`Python` script) captures *simulation metadata* and generates [*gantt chart*](https://en.wikipedia.org/wiki/Gantt_chart) by producing `html` file.
- Programming Language, Library and framework
  - `Modern C++`: Implementation of simulator
    - [Boost Unit Test Framework](https://www.boost.org/doc/libs/1_82_0/libs/test/doc/html/index.html)
    - [C++ Standard Template Library](https://en.wikipedia.org/wiki/Standard_Template_Library)
  - `Python 3`: Implementation of visualizer
    - [plotly](https://pypi.org/project/plotly/)
    - [asyncio](https://pypi.org/project/asyncio/)
  - `shell`: Organizatopm of above components

## Details

## Download