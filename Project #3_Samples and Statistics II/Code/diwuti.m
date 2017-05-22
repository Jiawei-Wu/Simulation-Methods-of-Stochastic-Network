p = [6 6 6 6 6 15 13 14 15 13]/100; N = 10000;
c=max(p)/0.05;
for i = 1:N, k = 0;
    while 1
        k = k + 1;
        j = 1 + floor(20*rand);   % Get Uniform j
        if j<=10
            if 3*rand < p(j)/0.05 % Accept p(j) if U<p(j)/c, q(j)= 0.1
                X(i) = j; C(i) = k;
                break
            end
        end
    end
end
Mu_X=mean(X)
Mu_C=mean(C)
Var_X=var(X)
Var_C=var(C)

Theo_Mean=1*0.06+2*0.06+3*0.06+4*0.06+5*0.06+6*0.15+7*0.13+8*0.14+9*0.15+10*0.13
%Theo_Variance=mean((p.^2))-(mean(p)).^2
Theo_Variance=0.0001*sum((X-Theo_Mean).^2)


% disp([ mean(X) sum(p.*[1:10]) mean(C) ])
Theo_Effiency=1/c
Test_Effiency=1/Mu_C

