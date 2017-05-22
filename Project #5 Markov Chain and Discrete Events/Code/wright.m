N=101;% X(50)=P[19 copies of A1, 100 copies of A2]
input=zeros(1,201);
input(N)=1;%Set the initial allele distribution
N = 100;%Set N=100 diploid heterozygous individuals

% transition matrix
P=zeros(2*N+1,2*N+1);
for i = 1:2*N+1
    for j = 1:2*N+1
        P(i,j) = nchoosek(2*N,j-1)*((i-1)/(2*N))^(j-1)*(1-(i-1)/(2*N))^(2*N-j+1);
    end  
end
n=100; % number of time steps to take
output=zeros(n+1,2*N+1); % clear out any old values

output(1,:)=input; % generate first output value
for i=1:n,
    output(i+1,:) = output(i,:)*P;
    %a tolerance check to  automatically stop the simulation when the density is close to its steady-state
    LIT = ismembertol(output(i+1,:),output(i,:));
    if all(LIT == 1)
        break;
    end
end