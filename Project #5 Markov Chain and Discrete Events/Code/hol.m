function f=hol(n)
r(i,j)=0.5;
Sys_state1=N1;
Sys_state2=N2;
Num_packet=N;
input1=randi([1,2],1,n);
input2=randi([1,2],1,n);
%%choose different values of p and then plot the result
arr_p=zero(1,N);
for i=1:N
p=rand;
arr_p(i)=p;
end

Num_buffer1=input1*p;
Num_buffer2=input2*p;