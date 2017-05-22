A = zeros(1,60);
A(1) = 0.2137;

data = rand
for i=2:60
    A(i)=A(i-1)+0.2137/i;
    if data < A(i)
        data_label = i;
        break
    end
end

data_label