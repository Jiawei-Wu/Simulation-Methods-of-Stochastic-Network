sigma1=[3 0; 0 1/2];
sigma2=[1 0; 0 2];
mu1=[0;4];
mu2=[-2;0];

wait1=0.5;
wait2=0.5;

for i=1:300
    u=rand;
    
    A1=chol(sigma1,'lower');
    A2=chol(sigma2,'lower');
    
    Z=randn(2,1);
    if u<wait1
        X=A1*Z+mu1;
    else
        X=A2*Z+mu2;
    end
    y(i,1)=X(1);
    y(i,2)=X(2);
end
y;



