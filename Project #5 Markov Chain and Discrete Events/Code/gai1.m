tA=0;%Initialize the arrival time
t=0;
T=100;
lamda_max=20;%Choose lamda such that lamda(t)<lamda for all t
buffer=1;
i=1;
totalbreaktime=0;
arrivaltime=0;
servicetime=0;
breaktime=0;
Ts=[];
t=[];
while(t<T)
    u1 = rand ();
    t = Ts(i) - log(u1)/lamda_max;
    u2 = rand();
    if (u2 <= (2*mod(t,10)/lamda))
        Ts(i+1) = t;
        i = i + 1;
    end
end
% 
% while(t<T)
%     u1=rand;
%     tA=tA-(1/lamda_max)*log(u1);
%     if mod(t+tA,10)<=5
%         lamda=4+3*mod(t+tA,10);
%     elseif mod(t+tA,10)>5
%         lamda=34-3*mod(t+tA,10);
%     end
%     if rand<=lamda/lamda_max
%         flag=0;
%     end
% end
