function f=count(N) %Define the function to count the number of heads 
EachNumH=0;% "EachNumH" represents the number of "Head" in each 50 flips
j=1;% "j" indicates the index of the empty array
arr=[];%create a new empty array to store variable "EachNumH"
for i=1:N
for k=1:50%Loop the program N*50 times which simulate tossing a coin N*50 times
    r=rand(1,50)
    if r(k)>0.5%Define the threshold as "0.5" since it is a fair coin
        EachNumH=EachNumH+1;
    end
end
arr(j)=EachNumH; %store the amount of "Head" in 50 flips into an empty array
EachNumH=0;%reset the variable "EachNumH" when loop 50 times 
j=j+1;
end
q=arr;
hist(q)%Generate a histogram to show the number of heads in 50 flips
xlabel ('The number of Head')
ylabel ('The number of experiments')
