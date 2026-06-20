% =========================================================
%  m2_service_queue.m
%  Member 2 - Service & Queue System
%  Hospital Emergency Department Simulation
%  CIT6114 Group Assignment
% =========================================================

    
    %1. Load member 1's data
    load('m1_output.mat'); 
    
    %2. Set service parameter
    mean_service_time = 15;
    
    %3. Generate service times for all patients
    service_times = zeros(1, num_patients); %Timetable(row, column)
    
        for i = 1:num_patients %1:80
            u = rand(); %Random dice between 0 and 1
            service_times(i) = -log(u) * mean_service_time;
        end
    
    %4. Set blank pages to write down the history of each patient
    service_start_times = zeros(1, num_patients); 
    service_end_times   = zeros(1, num_patients); 
    waiting_times       = zeros(1, num_patients); 
    assigned_dr         = zeros(1, num_patients);
    
    dr_free_time        = [0,0]; %Array for 2 doctor

    %5. Doctor distribution and waiting time
        for i = 1:num_patients 
            current_arrival = arrival_times(i);
            current_service = service_times(i);
            
            % 5a. Choose the doctor who is vacant first
            if dr_free_time(1) <= dr_free_time(2)
               chosen_dr = 1; 
            else 
               chosen_dr = 2; 
            end
            
            % 5b. Determine the service time start
            if current_arrival >= dr_free_time(chosen_dr) %Doctors are free atm 
               service_start_times(i) = current_arrival;
            else   
               service_start_times(i) = dr_free_time(chosen_dr);
            end
            
            % 5c. Calculate waiting time and service end
            waiting_times(i) = service_start_times(i) - current_arrival;
            service_end_times(i) = service_start_times(i) + current_service;
            
            % 5d. Update doctor free time and record
            dr_free_time(chosen_dr) = service_end_times(i);
            assigned_dr(i) = chosen_dr;
        end
    
    %6. Show results and save data
    fprintf('\n==================================================================================\n');
    fprintf('                          QUEUE & DOCTOR SYSTEM RESULTS\n');
    fprintf('==================================================================================\n');
    fprintf('                     Total Patients Processed : %d people\n', num_patients);
    fprintf('                   Max Waiting Time Recorded : %.2f minutes\n', max(waiting_times));
    fprintf('\n');
    
    fprintf('----------------------------------------------------------------------------------\n');
    fprintf(' Patient | Arrival (min) | Service (min) | Start (min) | Wait (min) | Doctor\n');
    fprintf('----------------------------------------------------------------------------------\n'); 

    for i = 1:num_patients 
        fprintf('     %3d |  %12.2f |  %12.2f | %11.2f | %10.2f | Doctor %d\n', ... 
        i, arrival_times(i), service_times(i), service_start_times(i), waiting_times(i), assigned_dr(i)); 
    end 

    fprintf('----------------------------------------------------------------------------------\n'); 

    save('m2_output.mat', 'arrival_times', 'num_patients', 'service_times', ...
         'service_start_times', 'service_end_times', 'waiting_times', 'assigned_dr'); 
    

    

