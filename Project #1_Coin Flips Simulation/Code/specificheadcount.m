function f=count_1(N)%Define a function to count the total number of tossing
x=0;
i=0;%"i" indicates the amount of tossing
while 1
    i=i+1;
    r=rand();
    if (r>0.5)&(x~=N)%Define outcome as "Head" if the random number is above 0.5 and the total tossing times is less than N  
        x=x+1;
    end
    if x==N%Exit loop when the required number of "heads" are completed
        break
    end  
end
 
D=i
