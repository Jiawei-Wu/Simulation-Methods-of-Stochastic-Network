A = zeros(1,60);
Count=0;
A(1) = 0.2137
while 1
    Count=Count+1;
    data = rand;
        for i=2:60
            A(i)=A(i-1)+0.2137/i;
                if data < A(i)
                    data_label = i;
                    break
                end
        end
    if data_label == 60
        break
    end
end
