function f=coin(N)%Define the function to count the number of "Heads"
NumH=0;%"NumH" represents the total number of "Head"
NumT=0;%"NumT" represents the total number of "Tail"
NumCH=0;%"NumCH" represents the number of continuous outcomes of "Head"
arr=[];%create an empty array to store variable "NumCH"
j=1;%"j" indicates the index for the empty array 
r=rand(1,N);%Generate an 1*N array with random value.
for i=1:N
    if r(i)>0.5%assume the threshold as "0.5" and above 0.5 as "Head"
        NumH=NumH+1;
        NumCH=NumCH+1;
    else
        NumT=NumT+1;
        arr(j)=NumCH; %store amount of “NumCH” into empty array
        NumCH=0;%reset the counter "NumCH" when outcome is "Tail”
        j=j+1;
    end
end
NumH
r=arr;%Count the number of "Head"
[MaxRun,Location]=max(r)%Record the longest run of heads
z=[NumH,NumT];%Create a histogram for the Bernoulli outcomes
bar(z)
title ('Bernoulli outcomes')
xlabel ('tossing result')
ylabel ('total number')
set(gca,'xticklabel',{'Head','Tail'})
