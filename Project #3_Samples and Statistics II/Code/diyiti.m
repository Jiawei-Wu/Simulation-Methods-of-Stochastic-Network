N=125;
K=5;
counts=zeros(1,10000);
for a1=1:10000
    counts(a1)=sum(randperm(125,6)<=K)>0;
end
probRejection = sum(counts)/10000;
Test_Value=probRejection;
disp(Test_Value);

c1=nchoosek(119,5);
c2=nchoosek(125,5);
p_accept=c1./c2;
p_reject = 1-p_accept;%Calculate the theoretical value of rejection probability.
Theo_Value = p_reject;
disp(Theo_Value);


