function y=digui(x)
r=rand(1,x);
n=length(r);
y(1)=x(1);
y(2)=x(2)-2*x(1);
y(3)=x(3)-2*x(2)+0.5*x(1);
for i=4:n-1
y(i)=x(i)-2*x(i-1)+0.5*x(i-2)-x(i-3);
end
arr=[];
arr=y