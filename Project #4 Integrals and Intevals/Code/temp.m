
clear; clc;
a=-2;
b=2;
arr_i=zeros(1000,1);
for i=1:1000
    u=rand();
    x=a+(b-a)*u;
    y=exp(x+x.^2).*(b-a);
    arr_i(i)=y;
end
Resul=sum(arr_i)/1000;

