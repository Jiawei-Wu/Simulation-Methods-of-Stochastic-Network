function f=co(i)
x=rand(4,10);
y(i)=x(i)-2*x(i-1)+0.5*x(i-2)-x(i-3);
Cov_Num=cov(x(i),y(i));
Cov_Num(1,2)