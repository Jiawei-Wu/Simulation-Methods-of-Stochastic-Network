function f=a(N)
alpha=0.05;
arr_Mu=zeros(1,N);
for j=1:N
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
t=Cov_Num(1,2);%Calculate the correlation coefficent
arr_Mu(j)=t;
end

c=sort(arr_Mu);
Mu_X1=prctile(arr_Mu,2.5)
Mu_X2=prctile(arr_Mu,97.5)%show the width of boostrap confidence interval for sample mean
CI = prctile(c,[100*alpha/2,100*(1-alpha/2)]);%Define the confidence interval
figure(2);
hist(c);
hold on;
T1=plot([CI(1),CI(1)], get(gca, 'YLim'), '-r', 'LineWidth', 3) % ?им?????ик????3
T2=plot([CI(2),CI(2)], get(gca, 'YLim'), '-y', 'LineWidth', 3) % ?им?????ик????3
hold off;
title('Bootstrap Confidence Interval for Correlation Coefficient');
xlabel('Different value of Correlation Coefficients');
ylabel('Quantity of Correlation Coefficients');
legend([T1,T2],'2.5% coefficient','97.5% coefficient');

