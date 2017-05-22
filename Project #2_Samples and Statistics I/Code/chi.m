x=0:0.1:10;
y1=chi2pdf(x,1);
plot(x,y1,'+')
hold on
y2=chi2pdf(x,3);
plot(x,y2,'.')
y3=chi2pdf(x,10);
plot(x,y3,':')
xlabel('x')
ylabel('y')
legend('自由度n=1','自由度n=2','自由度n=10')