function f=jifen(N)
x = -2:0.001:2;
y = exp(x+x.^2);
s = trapz(x,y)