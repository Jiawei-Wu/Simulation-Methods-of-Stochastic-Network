function f=Projec(N,K)%N represent the sample size, K represents the quantity of chips in each test.
counts=zeros(1,N);
for a1=1:N
    counts(a1)=sum(randperm(125,6)<=K)>0;
end
probRejection = sum(counts)/N;
Test_Probability=probRejection

c1=nchoosek(119,5);
c2=nchoosek(125,5);
p_accept=c1./c2;
p_reject = 1-p_accept;%Calculate the theoretical value of rejection probability.
Theo_Probability = p_reject


