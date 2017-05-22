clear all;
k=5.5;
theta=1;
% Sample code to find the maximum ratio c
pdfX = @(x) ( (x.^(k-1)).*exp(-x./theta) )./( (theta.^k).*gamma(k) ); % one-line function handle for f
pdfY = @(y) 1/k * exp(-y/k); % one-line function handle for g
t = 0:0.01:20;
ratio = pdfX(t)./pdfY(t);
c = max(ratio); % find the maximum ratio

figure(); % visualize the distributions
plot(t,pdfX(t),'linewidth',2);
hold on
plot(t,pdfY(t),'linewidth',2);
plot(t,c * pdfY(t),'r--','linewidth',2);
title('Diagram for Distributions');
xlabel('The Value of t');
ylabel('The Probability of Different t');
legend('pdf of Gamma(5.5,1)', 'pdf of Exponential(5.5)', 'c \cdot pdf of Exponential(5.5)')
hold off

N=1000;
for i = 1:N, k = 0;
    while 1
        k = k + 1;
        u=rand;
        j=-5.5*log(u);
            if c*rand < pdfX(j)/pdfY(j) % Accept p(j) if U<p(j)/c, q(j)= 0.1
                X(i) = j; 
                C(i) = k;
                break
            end
        end
end

accept_rate=N/sum(C)
figure();
hist(X,16);
hold on
T1=plot(t,pdfX(t)*N,'-r','linewidth',3);
title('Histogram for the Distribution (Smaple=1000)');
xlabel('Number of Outcomes');
ylabel('Quantity of Occurence Times');
legend([T1],'p.d.f. of Theoretical Distribution');
hold off


