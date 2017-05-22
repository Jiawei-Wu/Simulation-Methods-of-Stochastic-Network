function f=crea(N)
arr_Sample=zeros(1,N);
for i=1:N
    a=rand;
    b=poissinv(a,120);
    arr_Sample(i)=b;
end 
figure(1);
hist(arr_Sample);
hold on

x=1:180;
y=poisspdf(x,120).*7000;
plot(x,y,'-r','LineWidth', 3);
hold off