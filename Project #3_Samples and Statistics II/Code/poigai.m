function f=poigai(N)
random_sample1 = poissrnd(120,1,N);
random_sample2 = random_sample1;
figure(1);
hist(random_sample2);
M_num=max(random_sample1);
hold on

x=1:180;
y=poisspdf(x,120).*7000;
plot(x,y,'-r','LineWidth', 3);
hold off

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
MAX=max(arr);
MIN=min(arr);
figure(2)
hist(arr,(MAX-MIN+1))
hold on

x=80:180;
y=poisspdf(x,120).*N;
plot(x,y,'-r','LineWidth', 3);
hold off
hold off
