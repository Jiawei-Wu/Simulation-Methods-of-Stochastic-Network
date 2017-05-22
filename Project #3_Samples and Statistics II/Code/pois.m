function f=pois(N)
lamada=120;
N_interv=100000;
bernoulliTrials=0;
p=lamada/N_interv;
arr=[];
for j=1:N
bernoulliTrials=0;
for i=1:N_interv;
    if rand < p
        bernoulliTrials=bernoulliTrials+1;
    end
end
arr(j)=bernoulliTrials;
end
figure(1);
hist(arr);
hold on

x=1:180;
y=poisspdf(x,120).*7000;
T1=plot(x,y,'-r','LineWidth', 3);
hold off
title('Histogram for the Number of Arrivals Per Hour');
xlabel('Number of Arrivals Per Hour');
ylabel('Quantity of Different Arrivals');
legend([T1],'p.m.f. of Poission Distribution');

arr_Sample=zeros(1,N);
for i=1:N
    a=rand;
    b=poissinv(a,120);
    arr_Sample(i)=b;
end 
figure(2);
hist(arr_Sample);
hold on

x=1:180;
y=poisspdf(x,120).*7000;
T2=plot(x,y,'-r','LineWidth', 3);
hold off
title('Histogram for the Number of Arrivals Per Hour');
xlabel('Number of Arrivals Per Hour');
ylabel('Quantity of Different Arrivals');
legend([T2],'p.m.f. of Poission Distribution');

