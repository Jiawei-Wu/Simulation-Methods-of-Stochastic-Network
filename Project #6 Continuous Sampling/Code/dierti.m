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
legend('pdf of Gamma(3/2,1)', 'pdf of Exponential(3/2)', 'c \cdot pdf of Exponential(3/2)')
hold off

N=1000;
for i = 1:N, k = 0;
    while 1
        k = k + 1;
        j = 1 + floor(10*rand);% Get Uniform j
        if j<=10
            if c*rand < pdfX(j)/pdfY(j) % Accept p(j) if U<p(j)/c, q(j)= 0.1
                X(i) = j; C(i) = k;
                break
            end
        end
    end
end

figure();
hist(X);
hold on
x=1:10;
z=pdfX(x)*N;
T1=plot(x,z,'r+','markersize',15);
title('Histogram for the Distribution');
xlabel('Number of Outcomes');
ylabel('Quantity of Occurence Times');
legend([T1],'Distribution ');
hold off


