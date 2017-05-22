clc; clear; close all;

%Import the data txt
s = importdata('faithful.dat1.txt');
waiting = s(:,3);
eruption = s(:,2);
%Generate figure without kmeans clustering
scatter(waiting,eruption);
xlabel('waiting');
ylabel('eruption');
title('2D scatter plot without kmeans clustering');
%Generate figure with kmeans clustering
m=[eruption,waiting];
N = size(m,1);
[y,C]=kmeans(m,2);
figure;
plot(m(y==1,1),m(y==1,2), 'b*');
hold on;
plot(m(y==2,1),m(y==2,2), 'ro');
plot(C(1,1),C(1,2), 'gx','LineWidth',2);
plot(C(2,1),C(2,2), 'go','LineWidth',2);
title('2D scatter plot with kmeans clustering');
axis([1 6 10 120]);
hold off;
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
weight = [.5 .5];
SH=0;
%Compute the initial log-likelihood.
for i=1:N
    SH=SH+log(weight(1)*mvnpdf(m(i,:),miu(:,:,1)',covE(:,:,1))+weight(2)*mvnpdf(m(i,:),miu(:,:,2)',covE(:,:,2)));
end
L=SH/N;

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

%Draw the diagram for the final result
A=reshape(covE(:,:,1),[2 2]);
B=reshape(covE(:,:,2),[2 2]);
C = reshape(miu,[2 2]);
covEE=cat(3,A,B);
obj = gmdistribution(C',covEE,weight);
figure;
ezcontourf(@(x,y) pdf(obj,[x y]),[1 6],[10 120]);
title('contour plot of final GMM pdf overlayed with data set');
hold on;
%Overlay the contour plot with data set
plot(m(y==1,1),m(y==1,2), 'g*');
plot(m(y==2,1),m(y==2,2), 'ro');
hold off;
figure;
ezsurf(@(x,y)pdf(obj,[x y]),[1 6],[10 120]);
title('3D Final Diagram');