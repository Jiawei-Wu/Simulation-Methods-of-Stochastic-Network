function f=count(N)
Rand_Num=rand(1,N);
X_k=zeros(1,N-1);
for i=1:N-1
X_k(i)=Rand_Num(i);%Sequence X_k contains random number range from the first to the penultimate.
end
X_k1=zeros(1,N-1);%Sequence X_k1 contains random number range from the second to the last.
for i=2:N
X_k1(i-1)=Rand_Num(i);%Sequence X_k and X_k1 have the same length
end
Cov_Num=cov(X_k,X_k1);
Cov_Num(1,2)%Calculate the correlation coefficent
