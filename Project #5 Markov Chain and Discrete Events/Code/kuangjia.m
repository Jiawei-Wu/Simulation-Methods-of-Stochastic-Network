T_Start=Ts;
T_Service=0;
t=0;
t_break=0.3*rand(1);
Num_job=0;
while T_Service<T_Start % until the server start to serve and we have a job waiting
    T_Service=T_Service +t_break;
end
t = T_Start;
while t < T_Service %when finished Ts > T_Service
    t = Ts;
    %add a counter for the amount of jobs
end
t = T_Service;  %9:20 Ts 9:25 we have 3 job


%if there is a job
while T_Service < Ts
    T_Service = T_Service + servicetime;
    %counter -1 
    if counter ==0
        t = T_Service;
        break ;
    else % 9:26 deal with
        
    end
    t =Ts;
    
while t < Ts 



    