function f=Count_Sample(N)
arr_Sample=zeros(1,N);
for j=1:N
Sum_Smaple=0;%"Sum_Smaple" represents the inital value of Xi
Count=0;%"Count" represents the times of adding 
while 1
    Sum_Smaple=Sum_Smaple+rand;
    Count=Count+1;
    if Sum_Smaple > 4 %If the sum of Xi is more than 4, terminate the "while" loop
        break
    end
end
arr_Sample(j)=Count;%Store the times of adding into an array.
end
hist(arr_Sample);%Generate the histogram showing the adding times.
Mu_N=mean(arr_Sample);%Calculate the mean of adding times
hold on
T1=plot([Mu_N,Mu_N],ylim,'y-','LineWidth',2);
hold off
title('Histogram for the Number of N');
xlabel('The Number of N');
ylabel('Quantity of Different N');
legend([T1],'The Mean of N');
disp(Mu_N);
