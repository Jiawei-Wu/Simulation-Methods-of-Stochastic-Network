close all, clear all;
alpha=[0.5,1,1.8,2.0];
beta=[0,0.75];
gamma=1;
delta=0;
for i=1:4
    for j=1:2
        X = stblrnd(alpha(i),beta(j),gamma,delta,1000,1);    
        figure();
        subplot(2,1,1);
%         histogram(X,[-5:5]);
        histogram(X,'BinLimits',[-10,10])
        axis([-5 5 0 1000])
        hold on;
        x=-5:0.01:5;
        Y = stblpdf(x,alpha(i),beta(j),gamma,delta); 
        T1= plot(x,Y*1000,'r','linewidth',2);
        hold off;
        title(['This is figure for alpha=' num2str(alpha(i)) ' and beta=' num2str(beta(j))]);
        xlabel('The Value of Random Variables');
        ylabel('Quantity of Occurence Times');
        legend([T1],'p.d.f. of Theoretical Distribution');
        subplot(2,1,2);
        t=1:1000;
        plot(t,X);
        title(['Time Series Plot']);
        xlabel('The Sample Numbers');
        ylabel('The outcome Values');
    end
end


