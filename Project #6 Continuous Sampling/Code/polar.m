%%% Box-Muller Method
N=1000000;
Begin = zeros(100,1);
End = zeros(100,1);
for Loop = 1:100
    start = tic;
    Begin(Loop)=start;% Start the timer
    M1 = 1; % Mean of X
    M2 = 2; % Mean of Y
    V1 = 4; % Variance of X
    V2 = 9; % Variance of Y
    
    u1 = rand(N,1);
    u2 = rand(N,1);
    
    % Geberate X and Y that are N(0,1) random variables and independent
    X = sqrt( - 2*log(u1)).*cos(2*pi*u2 );
    Y = sqrt( - 2*log(u1)).*sin(2*pi*u2 );
    
    % Scale them to a particular mean and variance
    x = sqrt(V1)*X + M1; % x~ N(M1,V1)
    y = sqrt(V2)*Y + M2; % y~ N(M2,V2)
    
    
    End(Loop)=toc(start); % Read elapsed time from stopwatch
end
Consume_Time_Box=mean(End)
A=x+y;
exp_mean_Box=mean(A)
exp_variance_Box=var(A)
temp=cov(x,y);
Covariance_Box=temp(1,2)
i=min(A);
j=max(A);
figure();
hist(A,[j-i+1]);
hold on

t=i:j;
R=normpdf(t,3,sqrt(13));
M=R*N;
T1=plot(t,M,'-r','LineWidth', 3);
title('Histogram for Variable A by Box Muller Method (Samle=1000000)');
xlabel('The Value of A');
ylabel('The Occurence of Different A');
legend([T1],'p.d.f. of Theoretical Distribution');
hold off
%%%Polar Marsaglia Method
for Loop = 1:100
    start = tic;
    Begin(Loop)=start;% Start the timer
    M1 = 1; % Mean of X
    M2 = 2; % Mean of Y
    V1 = 4; % Variance of X
    V2 = 9; % Variance of Y
    i = 0; % the random number generated by the algorithm
    
    % Geberate X and Y that are N(0,1) random variables and independent
    while(i<=N-1)
        u1 = 2*rand()-1;
        u2 = 2*rand()-1;
        s = u1^2 + u2^2;
        if(s < 1)
            i = i + 1;
            X(i) = sqrt(-2*log(s)/s)*u1;
            Y(i) = sqrt(-2*log(s)/s)*u2;
        end
    end
    
    % Scale them to a particular mean and variance
    x = sqrt(V1)*X + M1; % x~ N(M1,V1)
    y = sqrt(V2)*Y + M2; % y~ N(M2,V2)
    End(Loop)=toc(start); % Read elapsed time from stopwatch
end
Consume_Time_Polar=mean(End)
A=x+y;
exp_mean_Polar=mean(A)
exp_variance_Polar=var(A)
temp=cov(x,y);
Covariance_Polar=temp(1,2)
i=min(A);
j=max(A);
figure();
hist(A,[j-i+1]);
hold on

t=i:j;
R=normpdf(t,3,sqrt(13));
M=R*N;
T1=plot(t,M,'-r','LineWidth', 3);
title('Histogram for Variable A by Polar Marsaglia Method (Samle=1000000)');
xlabel('The Value of A');
ylabel('The Occurence of Different A');
legend([T1],'p.d.f. of Theoretical Distribution');
hold off