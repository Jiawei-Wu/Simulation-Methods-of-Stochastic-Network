T_totalbreaktime=zeros(1,100);
for i=1:100
    %Initialize the arrival time
    t=0;
    T=100;
    lamda_max=20;%Choose lamda such that lamda(t)<lamda for all t
    buffer=0;
    tA=0;
    breaktime=0;
    totalbreaktime=0;
    servicetime=0;
    
    while t<T     
        if breaktime == 0;
            breaktime=0.3*rand(1);
        end        
        if servicetime==0
            servicetime=exprnd(1/25);
        end%Choose breaktime and servicetime by different distributions      
        while flag==1
            u1=rand;
            tA=tA-(1/lamda_max)*log(u1);
            if mod(t,10)<5
                lamda=4+3*mod(t,10);
            elseif mod(t,10)>=5
                lamda=34-3*mod(t,10);
            end
            if rand()<=lamda/lamda_max
                flag=0;
            end
        end
        
        if tA <= 0
            buffer=buffer+1;
            flag=1;
        elseif buffer==0
            t=t+breaktime;
            totalbreaktime = totalbreaktime + breaktime;
            tA=tA-breaktime;
            breaktime=0;
        else
            if servicetime > tA
                buffer=buffer+1;
                t=t+tA;
                servicetime=servicetime-tA;
                tA=0;
                flag=1;
            elseif servicetime < tA
                buffer=buffer-1;
                t=t+servicetime;
                tA=tA-servicetime;
                servicetime=0;
            else
                t=t+tA;
                tA=0;
                servicetime=0;
                flag=1;%Different cases of single server queueing system
            end
        end
    end
    T_totalbreaktime(i)=totalbreaktime;%Record the total amount of breaktime
end
averagebreaktime=mean(T_totalbreaktime)





