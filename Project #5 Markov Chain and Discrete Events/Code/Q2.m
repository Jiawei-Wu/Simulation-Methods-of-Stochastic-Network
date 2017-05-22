
clear; clc; close all;
arr_buffer1=zeros(1,11);
arr_buffer2=zeros(1,11);
arr_process=zeros(1,11);
j=0;
for pi=0:0.1:1
    j = j+1;
    n1=0;
    n2=0;
    temp1=0;
    temp2=0;
    buffer1=zeros(1,1000);
    buffer2=zeros(1,1000);
    process=zeros(1,1000);
    for i=1:1000
        P=rand();
        if P<pi
            n1=n1+1;
        end
        
        P1=rand();
        if P1<pi
            n2=n2+1;
        end
        
        if n1>0 && temp1==0
            r1=rand();
            if r1<0.5
                temp1=1;
            else
                temp1=2;
            end
        end
        
        if n2>0 && temp2==0
            r2=rand();
            if r2<0.5
                temp2=1;
            else
                temp2=2;
            end
        end
        
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
        elseif temp2 == 0 && temp2 > 0
            n1=n1-1;
            temp1 = 0;
            process(i)=1;
        else % temp1 == 0 && temp2 == 0
            % Nothing
        end
        buffer1(i)=n1;
        buffer2(i) = n2;
    end
    arr_buffer1(j)=mean(buffer1);
    arr_buffer2(j)=mean(buffer2);
    arr_process(j)=mean(process);
end
figure;
plot(0:0.1:1,arr_buffer1);
figure;
plot(0:0.1:1,arr_buffer2);
figure;
plot(0:0.1:1,arr_process);
