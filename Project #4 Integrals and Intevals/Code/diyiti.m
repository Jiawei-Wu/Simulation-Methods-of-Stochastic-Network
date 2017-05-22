function f=integ(N)
x=rand(N,1);
y=rand(N,1);
Exp_a=sum(4.*exp(4.*y-2+(4.*y-2).^2)./N);
Exp_b=sum(exp(-(1-1./y).^2)./(y.^2)./N)+sum(exp(-(1./y-1).^2)./y.^2./N);
Exp_c=sum(exp(-(x.^2+y.^2)))./N;
disp([Exp_a Exp_b Exp_c]);

syms x y;
Theo_a=integral(@(x)exp(x+x.^2),-2,2);
Theo_b=integral(@(x)exp(-x.^2),-inf,inf);
Theo_c=integral2(@(x,y) exp(-((x+y).^2)),0,1,0,1);
disp([Theo_a Theo_b Theo_c]);