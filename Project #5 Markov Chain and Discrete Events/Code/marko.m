function f=marko(N)
Num_indiv=100;%The number of diploid heterozygous individuals in the Wright-Fisher Model
input=zeros(1,201);
input(N)=1;%X(N)=[N copies of A1, N copies of A2]

n=1000;% number of time steps to take

P=zeros(2*N+1,2*N+1);% transition matrix
for i = 1:2*N+1
    for j = 1:2*N+1
        P(i,j) = nchoosek(2*N,j-1)*((i-1)/(2*N))^(j-1)*(1-(i-1)/(2*N))^(2*N-j+1);
    end  
end

output=zeros(n+1,2*N+1); 
output(1,:)=input; % generate the output values 

i = 0;
for i=1:n,
  output(i+1,:) = output(i,:)*P;
  %a tolerance check to  automatically stop the simulation when the density is close to its steady-state
  LIT = ismembertol(output(i+1,:),output(i,:));
  if all(LIT == 1)     
      break;
  end
end