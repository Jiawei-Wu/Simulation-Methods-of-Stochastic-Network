function f=coin(N)%Define the function the count the Head run lengths
data = zeros(1,N);%Create a zero array to store different head run length
random = rand(1,N);
NumCH = 0;%"NumCH" represents the number of continuous outcome of "Head"
for i=1:N
    if random(i)>=0.5
        NumCH = NumCH+1;
    elseif random(i)<0.5
        if NumCH~=0
            data(NumCH) = data(NumCH) + 1
        end;%Not showing the zero at the beginning of array
        NumCH = 0;
    end
end
for i = 1:100
    if sum(data(i:100))==0
        data = data(1:i-1);%Not showing the zero at the end of array
        break
    end
end
bar(data)
xlabel ('The Heads Run Lengths')
ylabel ('The Number of Times')
