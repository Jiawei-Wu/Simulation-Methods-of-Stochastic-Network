clc; clear; close all;
Ary_Break = zeros(100,1);
for i = 1:100
    t = 0;%initial time continuous%
    tA = 0;%inital time arrival%
    buffer = 0;%initial buffer time%
    tD = 0;%initial time departure%
    T = 100;%total hour%
    lambda_max = 20;%max lambda%
    temp = 0;%state value%
    n = 0;%counter%
    Total_buf=0;
    
    while t <= T
        %while loop use temp for state value%
        % generate nonhomogeneous Poission event%
        while temp == 0
            tA = tA + exprnd(1/lambda_max);
            if mod(t,10) < 5
                lambda = 4 + 3 * mod(t,10);
            else
                lambda = 34 - 3 * mod(t,10);
            end
            
            if rand() <= lambda/lambda_max
                temp = 1;
            end
        end
        %condition that no departures%
        if tD == 0
            tD = exprnd(1/25);
        end
        %condition that arrivals on breaks%
        if tA <= 0
            buffer = buffer + 1;
            temp = 0;
        elseif buffer == 0 %break arrvial%
            buffer = 0.3*rand();
            Total_buf = Total_buf + buffer;
            t = t + buffer;
            tA = tA - buffer;
            buffer = 0;
        else %service arrival%
            if tD < tA
                tA = tA - tD;
                t = t + tD;
                buffer = buffer - 1;
                tD = 0;  
            elseif tA < tD
                tD = tD - tA;
                t = t + tA;
                buffer = buffer + 1;
                tA = 0;
                temp = 0; 
            end
        end    
    end
    Ary_Break(i) = Total_buf;%ary of buffer times%

end
BreakM = mean(Ary_Break);%mean of the break time%

