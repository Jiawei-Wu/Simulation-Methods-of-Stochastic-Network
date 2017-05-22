
Time_Service=exprnd(25);
T_Start=0;
T_total=100;
i_job=1;
T_varible=0;
T_Next=0;
t = 1;
lamda=20;
Ts = 0;
T = 100; % the total time we want to analyze
i = 1;
while(t<T)
    if mod(t,10)<=6
        u1 = rand();
        Increase_lamda(t)=3*t+4;
        t = t - log(u1);
        u2 = rand();
        if u2<=Increase_lamda(t)/lamda
            Ts(i+1) = t;
            i = i + 1;
            break;
        end
    else
        u1 = rand ();
        Decrease_lamda(t)=34-3*t;
        t = Ts(i) - log(u1);
        u2 = rand();
        if u2<=Decrease_lamda(t)/lamda
            Ts(i+1) = t;
            i = i + 1;
            break;
        end
    end
end

