function f=ho(N,p)
arr_buffer1=zeros(1,101);
arr_buffer2=zeros(1,101);
arr_process=zeros(1,101);
arr_efficiency=zeros(1,101);
j=0;
for pi=0:0.01:1
    j = j+1;
    n1=0;
    n2=0;
    temp1=0;
    temp2=0;
    buffer1=zeros(1,N);
    buffer2=zeros(1,N);
    process=zeros(1,N);
    for i=1:N
        P=rand();
        if P<pi
            n1=n1+1;
        end
        
        P1=rand();
        if P1<pi
            n2=n2+1;
        end
 %Determine the number of packets in the input1 and input2 of the buffers       
        if n1>0 && temp1==0
            r1=rand();
            if r1<p
                temp1=1;
            else
                temp1=2;
            end
        end
 %Deternime the output of packets from input 1     
        if n2>0 && temp2==0
            r2=rand();
            if r2<p
                temp2=1;
            else
                temp2=2;
            end
        end
%Deternime the output of packets from input 2        
        if temp1>0 && temp2>0
            if temp1==temp2
                rnd=rand();
                if rnd<0.5
                    temp1=0;
                    n1=n1-1;
                else
                    temp2=0;
                    n2=n2-1;
                end
                process(i)=1;
            else
                temp1=0;
                temp2=0;
                n1=n1-1;
                n2=n2-1;
                process(i)=2;
            end
        elseif temp1 == 0 && temp2 > 0
            n2=n2-1;
            temp2 = 0;
            process(i)=1;
        elseif temp2 == 0 && temp1 > 0
            n1=n1-1;
            temp1 = 0;
            process(i)=1;
        else % temp1 == 0 && temp2 ==0
        end
 %Determine the number of packets in process      
        buffer1(i)=n1;
        buffer2(i) = n2;
    end
    arr_buffer1(j)=mean(buffer1);
    arr_buffer2(j)=mean(buffer2);
    arr_process(j)=mean(process);
    arr_efficiency(j)=sum(process)/(2*N);
end
sorted_efficiency=sort(arr_efficiency);
Mean_efficiency=mean(sorted_efficiency)
Std=std(sorted_efficiency);
z=norminv(0.975,0,1);
lowervalue_efficiency=Mean_efficiency-(Std/sqrt(101))*z
uppervalue_efficiency=Mean_efficiency+(Std/sqrt(101))*z
width_efficiency=uppervalue_efficiency-lowervalue_efficiency
figure;
plot(0:0.01:1,arr_buffer1);
title('The Distribution of the Mean of Packets Quantity in the Buffer at Input1');
xlabel('Arrival Probabiltiy P');
ylabel('The Mean of the Number of Packets in the Buffer at Input1');
grid on;
figure;
plot(0:0.01:1,arr_buffer2);
title('The Distribution of the Mean of Packets Quantity in the Buffer at Input2');
xlabel('Arrival Probability P');
ylabel('The Mean of the Number of Packets in the Buffer at Input2');
grid on;
figure;
plot(0:0.01:1,arr_process);
title('The Distribution of the Mean of Packets Quantity in the Process');
xlabel('Arrival Probability P');
ylabel('The Mean of the Number of Packets in Process');
grid on;
