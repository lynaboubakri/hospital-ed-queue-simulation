% =========================================================
%  m3_metrics.m
%  Member 3 - Performance Metrics & Analysis
%  Hospital Emergency Department Simulation
%  CIT6114 Group Assignment
% =========================================================


% ---------------------------------------------------------
%  STEP 1: Load Member 2 output
% ---------------------------------------------------------

load('m2_output.mat');

% ---------------------------------------------------------
%  STEP 2: Calculate Queue Length
% ---------------------------------------------------------

queue_length = zeros(1, num_patients);

for i = 1:num_patients

    current_time = arrival_times(i);

    % Number of patients who arrived
    arrived = sum(arrival_times <= current_time);

    % Number of patients who already started treatment
    started = sum(service_start_times <= current_time);

    % Patients still waiting in queue
    queue_length(i) = arrived - started;

end

avg_queue = mean(queue_length);

% ---------------------------------------------------------
%  STEP 3: Average Waiting Time
% ---------------------------------------------------------

avg_wait = mean(waiting_times);

% ---------------------------------------------------------
%  STEP 4: Total Patients Served
% ---------------------------------------------------------

total_patients = num_patients;

% ---------------------------------------------------------
%  STEP 5: Doctor Utilization
% ---------------------------------------------------------

% Total busy time for Doctor 1
busy1 = sum(service_times(assigned_dr == 1));

% Total busy time for Doctor 2
busy2 = sum(service_times(assigned_dr == 2));

% Total simulation time
total_time = max(service_end_times);

% Utilization percentage
util1 = busy1 / total_time * 100;
util2 = busy2 / total_time * 100;

% ---------------------------------------------------------
%  STEP 6: Display Results
% ---------------------------------------------------------

fprintf('\n');
fprintf('==========================================\n');
fprintf('    SIMULATION RESULTS\n');
fprintf('==========================================\n');

fprintf('Average Waiting Time : %.2f minutes\n', avg_wait);

fprintf('Average Queue Length : %.2f patients\n', avg_queue);

fprintf('Doctor 1 Utilization : %.2f %%\n', util1);

fprintf('Doctor 2 Utilization : %.2f %%\n', util2);

fprintf('Total Patients Served : %d patients\n', total_patients);

fprintf('==========================================\n');

% ---------------------------------------------------------
%  STEP 7: Plot Waiting Time Histogram
% ---------------------------------------------------------

figure(1);

hist(waiting_times);

xlabel('Waiting Time (minutes)');

ylabel('Number of Patients');

title('Waiting Time Distribution');

grid on;

% ---------------------------------------------------------
%  STEP 8: Plot Queue Length Over Time
% ---------------------------------------------------------

figure(2);

plot(arrival_times, queue_length, 'b-', 'LineWidth', 2);

xlabel('Time (minutes)');

ylabel('Queue Length');

title('Queue Length Over Time');

grid on;
