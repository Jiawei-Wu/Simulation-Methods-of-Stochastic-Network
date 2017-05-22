function f=Rej(N)
counts=zeros(1,N);
NumofchipTest=1;
while 1
    NumofchipTest=NumofchipTest+1;%Add the number of chips selected in each test from one.
for a1=1:N
    counts(a1)=sum(randperm(125,6)<=NumofchipTest)>0;
end
probRejection = sum(counts)/N;%Calculate the rejection probability when selecting 'NumofchipTest' chips in each test
Test_Value=probRejection;
if Test_Value >= 0.95
    break
end
end
disp(NumofchipTest);%If the rejection probability is no less than 95%, terminate the loop
    