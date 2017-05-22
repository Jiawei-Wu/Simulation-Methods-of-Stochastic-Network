arr_i=zeros(1,10000);
for j=1:10000
    r=rand;
    i=0;
    p=exp(-120);
    f=p;
    while r>=f
        p=p*(120)/(i+1);
        f=f+p;
        i=i+1;
    end
        arr_i(j)=i;
end
MAX=max(arr_i);
MIN=min(arr_i)
hist(arr_i,(MAX-MIN+1));
hold on

x=1:180;
y=poisspdf(x,120).*10000;
plot(x,y,'-r','LineWidth', 3);
hold off
        
        