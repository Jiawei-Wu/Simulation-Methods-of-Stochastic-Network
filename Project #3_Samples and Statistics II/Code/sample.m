function f=pro(N)
Num=0;
for i=1:N
    samp=randi([1 125],1,N);
    Num=Num+1;
    if samp(i)<7
        break;
    end
end
Num
        
