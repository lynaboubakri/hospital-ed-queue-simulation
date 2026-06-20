% ==================================================
% main.m 
% Member 4 - Main Simulation Controller
% Hospital Emergency Department Simulation
% ==================================================

clear all;
clc;
close all;

fprintf('=============================================\n');
fprintf(' HOSPITAL EMERGENCY DEPARTMENT SIMULATION\n');
fprintf('=============================================\n');

% Step 1: Run Member 1 module
fprintf('Running Member 1: Patient Arrival Generator...\n');
m1_arrivals;

% Step 2: Run Member 2 module
fprintf('\nRunning Member 2: Service and Queue System...\n');
m2_service_queue;

% Step 3: Run Member 3 module
fprint('\nRunning Member 3: Performance Metrics...\n');
m3_metrics.m;

fprintf('\n=============================================\n');
fprintf(' SIMULATION COMPLETED SUCCESSFULLY\n');
fprintf('=============================================\n');
