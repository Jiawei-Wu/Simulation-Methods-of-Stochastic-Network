function f=pro(N)%N represent the sample size, K represents the quantity of chips in each test.
counts=zeros(1,N);%Store the result of N times of tests in an array
for a1=1:N
    counts(a1)=sum(randperm(125,6)<=5)>0;%Calculate the amount of rejection times
end
probRejection = sum(counts)/N;%Obtain the test rejection probability
Test_Probability=probRejection

c1=nchoosek(119,5);
c2=nchoosek(125,5);
p_accept=c1./c2;%Calculate the theoretical value of rejection probability.
p_reject = 1-p_accept;%P(rejection)=1-P()
Theo_Probability = p_reject


