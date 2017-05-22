clc; clear; close all;
N=300;%Sample size
%case one-close subpopulations
% sigma1=[2 0; 0 2];
% sigma2=[1 0; 0.5 5];
% mu1=[0;3];
% mu2=[-3;0];
% weight1=0.5;
% weight2=0.5;
% weight=[0.5,0.5];

% %case two-well-seperated subpopulations
% sigma1=[2 0; 0 2];
% sigma2=[1 0; 0.5 5];
% mu1=[0;5];
% mu2=[-6;0];
% weight1=0.5;
% weight2=0.5;
% weight=[0.5,0.5];

%case three-spherical subpopulations
% sigma1=[2 0; 0 2];
% sigma2=[1 0; 0.5 5];
% mu1=[0;5];
% mu2=[-6;0];
% weight1=0.25;
% weight2=0.75;
% weight=[0.25,0.75];

%case four-spherical subpopulations
% sigma1=[2 0; 0 2];
% sigma2=[1 0; 0.5 5];
% mu1=[0;5];
% mu2=[-6;0];
% weight1=0.15;
% weight2=0.85;
% weight=[0.15,0.85];

%case five-ellipsoidal subpopulations
% sigma1=[1 -2; -2 6];
% sigma2=[4 0; 0 1];
% mu1=[0;5];
% mu2=[-6;0];
% weight1=0.25;
% weight2=0.75;
% weight=[0.25,0.75];


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
L=SH/N;

%Draw the diagram for the first step
A=reshape(covE(:,:,1),[2 2]);
B=reshape(covE(:,:,2),[2 2]);
C = reshape(miu,[2 2]);
covEE=cat(3,A,B);
obj = gmdistribution(C,covEE,weight);
figure;
ezcontourf(@(x,y) pdf(obj,[x y]),[-10 10],[-10 10]);
title('2D Initial Diagram');
figure;
ezsurf(@(x,y)pdf(obj,[x y]),[-10 10],[-10 10]);
title('3D Intial Diagram');

%E-steps
Nor=zeros(N,2);
n=zeros(1,2);
Lnew=0;
counter=0;
while abs(L-Lnew)>0.001
    L=Lnew;
    for j=1:2
        for i=1:N
            SP=0;
            for z=1:2
                SP=weight(1)*mvnpdf(m(i,:),miu(:,:,1)',covE(:,:,1))+weight(2)*mvnpdf(m(i,:),miu(:,:,2)',covE(:,:,2));
            end
            Nor(i,j)=weight(j)*mvnpdf(m(i,:),miu(:,:,j)',covE(:,:,j))/SP;
        end
    end
    n(1)=sum(Nor(:,1));
    n(2)=sum(Nor(:,2));
    %M-steps
    weight=n/N;
    for j=1:2
        miu(:,:,j)=(Nor(:,j)'*m/n(j))';
        Acov=zeros(2,2);
        for i=1:N
            Acov=Acov+Nor(i,j)*(m(i,:)'-miu(:,:,j))*(m(i,:)'-miu(:,:,j))';
        end
        covE(:,:,j)=Acov/n(j);
    end
    
    SH=0;
    for i=1:N
        SH=SH+log(weight(1)*mvnpdf(m(i,:),miu(:,:,1)',covE(:,:,1))+weight(2)*mvnpdf(m(i,:),miu(:,:,2)',covE(:,:,2)));
    end
    Lnew=SH/N;
    counter=counter+1;
    
end
%Display the quality GMM-EM estimations
covE
miu
%Display the speed of GMM-EM estimations
speed=counter;
speed
%Display the final weight of GMM-EM estimations
Finalweight=weight;
Finalweight
%Draw the diagram for the last step
A=reshape(covE(:,:,1),[2 2]);
B=reshape(covE(:,:,2),[2 2]);
C = reshape(miu,[2 2]);
covEE=cat(3,A,B);
obj = gmdistribution(C,covEE,weight);
figure;
ezcontourf(@(x,y) pdf(obj,[x y]),[-10 10],[-10 10]);
title('2D Final Diagram');
figure;
ezsurf(@(x,y)pdf(obj,[x y]),[-10 10],[-10 10]);
title('3D Final Diagram');