T_totalbreaktime=zeros(1,100);
for i=1:100
    t=0;
    T=100;
    lamda_max=20;%Choose lamda such that lamda(t)<lamda for all t
    buffer=0;
    counter=0;
    totalbreaktime=0;
    arrivaltime=0;
    departuretime=0;
    breaktime=0;
    totalbreaktime=0;
    
    while t<T
        
        while flag==1
            %             u1=rand;
            arrivaltime=arrivaltime+exprnd(1/lamda_max);
            %             tA=tA-(1/lamda_max)*log(u1);
            if mod(t,10)<5
                lamda=4+3*mod(t,10);
            elseif mod(t,10)>5
                lamda=34-3*mod(t,10);
            end
            if rand()<=lamda/lamda_max
                flag=0;
            end
        end
        
        if departuretime==0;
            departuretime=exprnd(1/25);
        end
        if arrivaltime <=0;
            buffer=buffer+1;
            flag==1;   
        elseif buffer==0;
            breaktime=0.3*rand();
            totalbreaktime=totalbreaktime+breaktime;
            t=t+breaktime;
            arrivaltime=arrivaltime-breaktime;
            breaktime=0;
        else
            if departuretime>arrivaltime
                departuretime=departuretime-arrivaltime;
                t=t+arrivaltime;
                buffer=buffer+1;
                arrivaltime=0;
                flag=1;
            elseif departuretime<arrivaltime
                arrivaltime=arrivaltime-departuretime;
                t=t+departuretime;
                buffer=buffer-1;
                departuretime=0;
            end
        end
        
        T_totalbreaktime(i)=totalbreaktime;
    end
end

T_breaktime=mean(T_totalbreaktime);
