% =========================================================
%  m1_arrivals.m
%  Member 1 - Patient Arrival Generator
%  Hospital Emergency Department Simulation
%  CIT6114 Group Assignment
% =========================================================


% ---------------------------------------------------------
%  STEP 1:Set parameters 
% ---------------------------------------------------------

lambda       = 10/60;   % average 10 patients/hour
sim_duration = 480;    % 8 hour shift

% ---------------------------------------------------------
%  STEP 2:Generate patient arrival times
% ---------------------------------------------------------

arrival_times = [];
current_time  = 0;
patient_count = 0;

while true
  % exponential distribution formula
  % gap between one patient and the next
  u            = rand();
  gap          = -log(u) / lambda;
  current_time = current_time + gap;

  % stop when shift is over
  if current_time > sim_duration
    break;
  end

  patient_count = patient_count + 1;
  arrival_times(patient_count) = current_time;
end

num_patients = patient_count;

% ---------------------------------------------------------
%  STEP 3:Build patient table
% ---------------------------------------------------------

patient_table = zeros(num_patients, 2);
for i = 1:num_patients
  patient_table(i, 1) = i;
  patient_table(i, 2) = arrival_times(i);
end

% ---------------------------------------------------------
%  STEP 4:Display results in command window
% ---------------------------------------------------------

fprintf('==========================================\n');
fprintf('        PATIENT ARRIVAL RESULTS\n');
fprintf('==========================================\n');
fprintf('Arrival rate (lambda)  : %.4f patients/minute\n', lambda);
fprintf('Simulation duration    : %d minutes\n', sim_duration);
fprintf('Total patients arrived : %d\n', num_patients);
fprintf('Expected patients      : %d\n', round(lambda * sim_duration));
fprintf('First patient arrived  : %.4f minutes\n', arrival_times(1));
fprintf('Last  patient arrived  : %.4f minutes\n', arrival_times(end));
fprintf('\n');

fprintf('------------------------------------------\n');
fprintf('  Patient ID  |  Arrival Time (minutes)\n');
fprintf('------------------------------------------\n');
for i = 1:num_patients
  fprintf('     %3d      |      %.4f\n', patient_table(i,1), patient_table(i,2));
end
fprintf('------------------------------------------\n');

% ---------------------------------------------------------
%  STEP 5:Save output for M4
% ---------------------------------------------------------

save('m1_output.mat', 'arrival_times', 'num_patients', 'patient_table', 'lambda', 'sim_duration');
fprintf('\n>> Saved to m1_output.mat\n');

% ---------------------------------------------------------
%  STEP 6: Plot arrival graph
% ---------------------------------------------------------
 
figure(1);
plot(arrival_times, 1:num_patients, 'b-', 'LineWidth', 2);
hold on;
t = linspace(0, sim_duration, 100);
plot(t, lambda * t, 'r--', 'LineWidth', 1.5);
hold off;
xlabel('Time (minutes)');
ylabel('Number of patients arrived');
title('Patient Arrival Pattern');
legend('Simulated arrivals', 'Expected average');
grid on;

 
