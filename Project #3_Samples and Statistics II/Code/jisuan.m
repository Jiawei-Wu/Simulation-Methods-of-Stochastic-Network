c1=nchoosek(119,5);
c2=nchoosek(125,5);
p_accept=c1./c2;
p_reject = 1-p_accept;
Theo_Value = p_reject;
disp(Theo_Value);%Calculate the theoretical value of rejection probability.


