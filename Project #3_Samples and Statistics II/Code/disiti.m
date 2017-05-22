sum=0;
for i=1:60
    a_a=1/i;
    sum=sum+a_a;
end
a_Value = 1/sum

y=zeros(1,60);
a=[1 2 5 7]
for i=1:4
b=sum(a(:))

y=zeros(1,4);
a=[1 2 5 7];
for i=1:4
y(i)=sum(a(:,(1:i)));
end
y

    