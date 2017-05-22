x = randi([0 9],1,10)
a=zeros(0,9);
for i=1:10
a(i)=sum(x==(i-1));
end
a