%1. Load Member 1's data
load('m1_output.mat');

%2. Set service parameter
mean_service_time = 15;

%3. Generate service times
service_times = zeros(1, num_patients);

for i = 1:num_patients
    u = rand();
    service_times(i) = -log(u) * mean_service_time;
end

%4. Prepare patient records
service_start_times = zeros(1, num_patients);
service_end_times   = zeros(1, num_patients);
waiting_times       = zeros(1, num_patients);
assigned_dr         = zeros(1, num_patients);

%3 doctors for improvement scenario
dr_free_time = [0, 0, 0];

%5. Doctor assignment and waiting time
for i = 1:num_patients
    current_arrival = arrival_times(i);
    current_service = service_times(i);

    %Choose doctor who becomes free earliest
    [earliest_time, chosen_dr] = min(dr_free_time);

    if current_arrival >= dr_free_time(chosen_dr)
        service_start_times(i) = current_arrival;
    else
        service_start_times(i) = dr_free_time(chosen_dr);
    end

    waiting_times(i) = service_start_times(i) - current_arrival;
    service_end_times(i) = service_start_times(i) + current_service;

    dr_free_time(chosen_dr) = service_end_times(i);
    assigned_dr(i) = chosen_dr;
end

%6. Show results
fprintf('\n==================================================================================\n');
fprintf('                    IMPROVEMENT QUEUE SYSTEM RESULTS - 3 DOCTORS\n');
fprintf('==================================================================================\n');
fprintf('Total Patients Processed : %d people\n', num_patients);
fprintf('Max Waiting Time Recorded: %.2f minutes\n', max(waiting_times));

%7. Save data
save('m4_output_improved.mat', 'arrival_times', 'num_patients', 'service_times', ...
     'service_start_times', 'service_end_times', 'waiting_times', 'assigned_dr');

fprintf('\n>> Improvement data saved in m4_output_improved.mat.\n');
    

