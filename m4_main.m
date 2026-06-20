%==================================================
% main.m 
% Member 4 - Main Simulation Controller
% Hospital Emergency Department Simulation
% Baseline Simulation (2 Doctors)
% ==================================================

clear all;
clc;
close all;

fprintf('=============================================\n');
fprintf(' HOSPITAL EMERGENCY DEPARTMENT SIMULATION\n');
fprintf(' BASELINE SIMULATION 2 Doctors\n');
fprintf('=============================================\n\n');

%Step 1: Run Member 1 module
fprintf('Running Member 1: Patient Arrival Generator...\n');
m1_arrivals;

%Step 2: Run Member 2 module
fprintf('\nRunning Member 2: Service and Queue System...\n');
m2_service_queue;

%Step 3: Run Member 3 module
fprint('\nRunning Member 3: Performance Metrics...\n');
m3_metrics.m;

%Step 4: Store baseline results
baseline.avg_wait = avg_wait;
baseline.avg_queue = avg_queue;
baseline.total_patients = total_patients;
baseline.util1 = util1;
baseline.util2 = util2;
baseline.avg_util - (util + util2)/2;

save('baseline_results.mat','baseline');

%Step 5: Display saved baseline results
fprintf('\n=============================================\n');
fprintf(' BASELINE RESULTS STORED SUCCESSFULLY\n');
fprintf('===============================================\n');
fprintf('Average Waiting Time: %.2f minutes\n', baseline.avg_wait);
fprintf('Average Queue Length: %.2f patients\n', baseline.avg_queue);
fprintf('Doctor 1 Utilization: %.2f %%\n', baseline.util1);
fprintf('Doctor 2 Utilization: %.2f %%\n', baseline.util2);
fprintf('Average Utilization: %.2f %%\n', baseline.avg_util);
fprintf('Total Patients Served: %d patients\n', baseline.total_patients);
fprintf('Saved file: baseline_results.mat\n');
fprintf('===============================================\n');

fprintf('\n=============================================\n');
fprintf(' SIMULATION COMPLETED SUCCESSFULLY\n');
fprintf('=============================================\n');
