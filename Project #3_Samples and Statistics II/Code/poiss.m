function f=poiss(N)
lamada=120;
N_interv=100000;%Cut one hour into 100000 subintervals.
bernoulliTrials=0;
p=lamada/N_interv;%The successful probability for each Bernoulli trial.
arr=[];
for j=1:N
bernoulliTrials=0;%Using equivalent Bernoulli trial method to simulate sampling
for i=1:N_interv;
    if rand < p
        bernoulliTrials=bernoulliTrials+1;
    end
end
arr(j)=bernoulliTrials;%Store the sum of Bernoulli trials outcomes into an array.
end
figure(1);
MAX=max(arr);
MIN=min(arr)
hist(arr,(MAX-MIN+1));
hold on

x=1:180;
y=poisspdf(x,120)*N;
T1=plot(x,y,'-r','LineWidth', 3);%Overlay the p.m.f. of Poisson distribution
hold off
title('Histogram for the Number of Arrivals Per Hour');
xlabel('Number of Arrivals Per Hour');
ylabel('Quantity of Different Arrivals');
legend([T1],'p.m.f. of Poission Distribution');


arr_i=zeros(1,N);%Using inverse transform method to simulate sampling
for t=1:N
    r=rand;%Generate x-U[0,1]
    k=0;
    P=exp(-120);%Calculate the initial Poisson probability
    f=P;
    while r>=f %While r<f,terminate the loop
        P=P*(120)/(k+1);%Calculate the cumulative Poisson probability
        f=f+P;
        k=k+1;
    end
        arr_i(t)=k;%Store the value of k into an array
end
MAXa=max(arr_i);
MINa=min(arr_i);
figure(2);
hist(arr_i,(MAXa-MINa+1));%Generate the histogram to show the distribution of samples
hold on

x_a=1:180;
y_a=poisspdf(x,120)*N;
T2=plot(x_a,y_a,'-r','LineWidth', 3);%Overlay the p.m.f. of Poisson distribution
hold off
title('Histogram for the Number of Arrivals Per Hour');
xlabel('Number of Arrivals Per Hour');
ylabel('Quantity of Different Arrivals');
legend([T2],'p.m.f. of Poission Distribution'); 



arr_Sample=zeros(1,N);
for z=1:N
    a=rand;
    b=poissinv(a,120);%Using "poissinve" to simulate sampling
    arr_Sample(z)=b;
end 
figure(3);
MAXb=max(arr_Sample);
MINb=min(arr_Sample)
hist(arr_Sample,(MAXb-MINb+1));%Generate the histogram to show the distribution of samples
hold on

x_b=1:180;
y_b=poisspdf(x,120)*N;
T3=plot(x_b,y_b,'-r','LineWidth', 3);%Overlay the p.m.f. of Poisson distribution
hold off
title('Histogram for the Number of Arrivals Per Hour');
xlabel('Number of Arrivals Per Hour');
ylabel('Quantity of Different Arrivals');
legend([T3],'p.m.f. of Poission Distribution');