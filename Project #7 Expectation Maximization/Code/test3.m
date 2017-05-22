function f=Gau(N);
sigma1=[3 0; 0 1/2];
sigma2=[1 0; 0 2];
mu1=[0;4];
mu2=[-2;0];

weight1=0.5;
weight2=0.5;
weight=[weight1,weight2];
%Generating samples with multivariate Gaussian distribution
for i=1:N
    u=rand;
    
    A1=chol(sigma1,'lower');
    A2=chol(sigma2,'lower');
    
    Z=randn(2,1);
    if u<weight1
        X=A1*Z+mu1;
    else
        X=A2*Z+mu2;
    end
    m(i,1)=X(1);
    m(i,2)=X(2);
end
%Initialize with k-means algorithm.
[y,C]=kmeans(m,2);
miu1=C(1,:);
miu2=C(2,:);
%Obtain the centers of two subpopulations and set as the first estimation
%of mean.
miu=zeros(2,1,2);
miu(:,:,1)=miu1';
miu(:,:,2)=miu2';
%Set the initial guess of covariance matrix.
covE=zeros(2,2,2);
covE(:,:,1)=[1 0;0 1];
covE(:,:,2)=[1 0;0 1];
SH=0;
%Compute the initial log-likelihood.
for i=1:N
SH=SH+log(weight(1)*mvnpdf(m(i,:),miu(:,:,1)',covE(:,:,1))+weight(2)*mvnpdf(m(i,:),miu(:,:,2)',covE(:,:,2)));
end
L=SH/300;

%E-steps
Nor=zeros(N,2);
n=zeros(1,2);
for j=1:2
    for i=1:N
        SP=0;
        for z=1:2
        SP=SP+weight(1)*mvnpdf(m(i,:),miu(:,:,1)',covE(:,:,1));
        end
        Nor(i,j)=weight(j)*mvnpdf(m(i,:),miu(:,:,j)',covE(:,:,j))/SP;
    end
end
n(1)=sum(Nor(:,1));
n(2)=sum(Nor(:,2));
%M-steps
for j=1:2
    miu(:,:,j)=(Nor(:,j)'*m/n(j))';
    Acov=zeros(2,2);
    for i=1:N
        Acov=Acov+Nor(i,j)*(m(i,:)'-miu(:,:,j))*(m(i,:)'-miu(:,:,j))';
    end
    covE(:,:,j)=Acov/n(j);
end
obj = gmdistribution(miu,covE,weight);
figure;
ezcontourf(@(x,y) pdf(obj,[x y]));
 
SH=0;
for i=1:N
    SH=SH+log(weight(1)*mvnpdf(m(i,:),miu(:,:,1)',covE(:,:,1))+weight(2)*mvnpdf(m(i,:),miu(:,:,2)',covE(:,:,2)));
end
Lnew=SH/N;
end

