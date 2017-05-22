function y=digui(N)
x=rand(1,N);
for i=1:N
    if N==1
        y(1)=x(1);
        y=[y(1)];
    elseif N==2
        y(1)=x(1);
        y(2)=x(2)-2*x(1);
        y=[y(1),y(2)];
    elseif N==3   
        y(1)=x(1);
        y(2)=x(2)-2*x(1);
        y(3)=x(3)-2*x(2)+0.5*x(1);
        y=[y(1),y(2),y(3)];
    else
        y(1)=x(1);
        y(2)=x(2)-2*x(1);
        y(3)=x(3)-2*x(2)+0.5*x(1);
        Y=zeros(1,N-3);
        for i=4:N
            y(i-3)=x(i)-2*x(i-1)+0.5*x(i-2)-x(i-3);
            Y(i-3)=y(i-3);
        end
    y=[y(1),y(2),y(3),Y];%Generate the array to store the value of y
    end
end
Cov_Num=cov(x,y);
Cov_Num(1,2)
plot(x,y)