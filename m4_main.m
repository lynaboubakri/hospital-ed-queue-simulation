%==================================================
% m4_main.m
% Member 4 - Main Simulation Controller
% Hospital Emergency Department Simulation
% Baseline + Improvement
%==================================================


fprintf('=============================================\n');
fprintf(' HOSPITAL EMERGENCY DEPARTMENT SIMULATION\n');
fprintf(' BASELINE VS IMPROVEMENT\n');
fprintf('=============================================\n\n');

%BASELINE: 2 DOCTORS
fprintf('\n=============================================\n');
fprintf(' BASELINE SIMULATION: 2 DOCTORS\n');
fprintf('=============================================\n');

fprintf('Running Member 1\n');
m1_arrivals;

fprintf('\nRunning Member 2\n');
m2_service_queue;

fprintf('\nRunning Member 3\n');
m3_metrics;

baseline_avg_wait = avg_wait;
baseline_avg_queue = avg_queue;
baseline_total_patients = total_patients;
baseline_util1 = util1;
baseline_util2 = util2;
baseline_avg_util = (util1 + util2)/2;

save('baseline_results.mat', 'baseline_avg_wait', 'baseline_avg_queue', 'baseline_total_patients', 'baseline_util1', 'baseline_util2', 'baseline_avg_util');

figure(1); title('Waiting Time Distribution (Baseline - 2 Dr)');
figure(2); title('Queue Length Over Time (Baseline - 2 Dr)');

%IMPROVEMENT: 3 DOCTORS
fprintf('\n=============================================\n');
fprintf(' IMPROVEMENT SIMULATION: 3 DOCTORS\n');
fprintf('=============================================\n');

fprintf('\nRunning Improvement Service and Queue System...\n');
m4_service_queue_3dr;

load('m4_output_improved.mat');

queue_length_imp = zeros(1, num_patients);
for i = 1:num_patients
    current_time = arrival_times(i);
    arrived = sum(arrival_times <= current_time);
    started = sum(service_start_times <= current_time);
    queue_length_imp(i) = arrived - started;
end

improved_avg_wait = mean(waiting_times);
improved_avg_queue = mean(queue_length_imp);
improved_total_patients = num_patients;
total_time_imp = max(service_end_times);
imp_util1 = sum(service_times(assigned_dr == 1)) / total_time_imp * 100;
imp_util2 = sum(service_times(assigned_dr == 2)) / total_time_imp * 100;
imp_util3 = sum(service_times(assigned_dr == 3)) / total_time_imp * 100;
improved_avg_util = (imp_util1 + imp_util2 + imp_util3) / 3;

save('improved_results.mat', 'improved_avg_wait', 'improved_avg_queue', 'improved_total_patients', 'improved_util1', 'improved_util2', 'improved_util3', 'improved_avg_util');

figure(3); hist(waiting_times); grid on;
xlabel('Waiting Time (minutes)'); ylabel('Number of Patients');
title('Waiting Time Distribution (Improved - 3 Dr)');

figure(4); plot(arrival_times, queue_length_imp, 'r-', 'LineWidth', 2); grid on;
xlabel('Time (minutes)'); ylabel('Queue Length');
title('Queue Length Over Time (Improved - 3 Dr)');

%COMPARISON TABLE
fprintf('\n=============================================\n');
fprintf(' PERFORMANCE COMPARISON TABLE\n');
fprintf('=============================================\n');

fprintf('%-30s %-15s %-15s\n', 'Metric', 'Baseline', 'Improved');
fprintf('------------------------------------------------------------\n');

fprintf('%-30s %-15.2f %-15.2f\n', 'Average Waiting Time', baseline_avg_wait, improved_avg_wait);
fprintf('%-30s %-15.2f %-15.2f\n', 'Average Queue Length', baseline_avg_queue, improved_avg_queue);
fprintf('%-30s %-15.2f %-15.2f\n', 'Doctor Utilization (%)', baseline_avg_util, improved_avg_util);
fprintf('%-30s %-15d %-15d\n', 'Total Patients Served', baseline_total_patients, improved_total_patients);

fprintf('=============================================\n');

fprintf('\nResults saved successfully:\n');
fprintf('- baseline_results.mat\n');
fprintf('- improved_results.mat\n');

fprintf('\n=============================================\n');
fprintf(' SIMULATION COMPLETED SUCCESSFULLY\n');
fprintf('=============================================\n');
