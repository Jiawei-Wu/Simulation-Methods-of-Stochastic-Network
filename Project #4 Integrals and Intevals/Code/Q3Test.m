Z=norminv(0.025);
% Rightlim=norminv(0.975);

T=tinv(0.025,14);
% Rightlim1=tinv(0.975,14);

s = importdata('faithful.dat1.txt');
waiting_T = s(:,3);
% arr_a=[];
% arr_a=s(1:15,3);
% m=std(s);
ss_t=std(waiting_T(1:15));
Mu_t=mean(waiting_T(1:15));
ss_z=std(waiting_T(1:272));
Mu_z=mean(waiting_T(1:272));
Leftconfit_t=Mu_t-(ss_t/(sqrt(15)))*T;
Righconfit_t=Mu_t+(ss_z/(sqrt(15)))*T;
Theo_Width_T=abs(Leftconfit_t-Righconfit_t);


Leftconfit_z=Mu_z-(ss_z/(sqrt(272)))*Z;
Righconfit_z=Mu_z+(ss_z/(sqrt(272)))*Z;
Theo_Width_Z=abs(Leftconfit_z-Righconfit_z);



arr_Mu=zeros(1,100);
Rand_Sel=[];
for i=1:1000
Rand_Ind=randi([1 15],15,1);
Rand_Sel=waiting_T(Rand_Ind,:);
sample_Mu=mean(Rand_Sel);
arr_Mu(i)=sample_Mu;
end
c=sort(arr_Mu);
Mu_T1=prctile(arr_Mu,2.5);
Mu_T2=prctile(arr_Mu,97.5);%show the width of bootstrap confidence interval for sample mean
Expe_Width_T=abs(Mu_T1-Mu_T2);

arr_Mu1=zeros(1,1000);
Rand_Sel1=[];
for i=1:1000
Rand_Ind1=randi([1 272],272,1);
Rand_Sel1=waiting_T(Rand_Ind1,:);
sample_Mu1=mean(Rand_Sel1);
arr_Mu1(i)=sample_Mu1;
end
c1=sort(arr_Mu1);
Mu_Z1=prctile(arr_Mu1,2.5);
Mu_Z2=prctile(arr_Mu1,97.5);%show the width of bootstrap confidence interval for sample mean
Expe_Width_Z=abs(Mu_Z1-Mu_Z2);