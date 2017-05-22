function f=count(N)
pro_arr=zeros(1,120);
for i=1:120
c1=nchoosek(6,1);
c2=nchoosek(119,i-1);
c3=nchoosek(125,i);
p=(c1.*c2)./c3;
pro_arr(i)=p;
end
k=0;
c=1/0.05;
arr_K=zeros(1,N);
arr_C=zeros(1,N);
for j=1:N
    while 1
        k=k+1;
        t=randi([1,120],1,1);
        if (c*rand) < pro_arr(t)./(1/120)
            arr_X(j)=t;
            arr_C(j)=k;
            break
        end
    end
end
hist(arr_C);
min(arr_C)
    