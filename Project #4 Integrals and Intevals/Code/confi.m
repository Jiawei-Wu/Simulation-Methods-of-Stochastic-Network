function f=confi(N)
Z=norminv(0.975);
T=tinv(0.975,14);
%Compute the value of T(alpha/2) and Z(alpha/2)
s = importdata('faithful.dat1.txt');
%Import the data table
waiting_T = s(:,3);
%Record the values of waiting time
ss_t=std(waiting_T(1:15));
Mu_t=mean(waiting_T(1:15));
Theo_Leftconfit_T=Mu_t-(ss_t/(sqrt(15)))*T
Theo_Righconfit_T=Mu_t+(ss_t/(sqrt(15)))*T
Theo_Width_T=abs(Theo_Leftconfit_T-Theo_Righconfit_T)
%Compute a 95% statistical confidence interval using the first 15 data
arr_Mu=zeros(1,N);
Rand_Sel=[];
for i=1:N
Rand_Ind=randi([1 15],15,1);
Rand_Sel=waiting_T(Rand_Ind,:);
sample_Mu=mean(Rand_Sel);
arr_Mu(i)=sample_Mu;
end
c=sort(arr_Mu);
Exp_Leftconfit_T=prctile(arr_Mu,2.5)
Exp_Righconfit_T=prctile(arr_Mu,97.5)
Expe_Width_T=abs(Exp_Leftconfit_T-Exp_Righconfit_T)
%Compute a 95% bootstrap confidence interval using the first 15 data
ss_z=std(waiting_T(1:272));
Mu_z=mean(waiting_T(1:272));
Theo_Leftconfit_Z=Mu_z-(ss_z/(sqrt(272)))*Z
Theo_Righconfit_Z=Mu_z+(ss_z/(sqrt(272)))*Z
Theo_Width_Z=abs(Theo_Leftconfit_Z-Theo_Righconfit_Z)
%Compute a 95% statistical confidence interval using all of the data 
arr_Mu1=zeros(1,N);
Rand_Sel1=[];
for i=1:N
Rand_Ind1=randi([1 272],272,1);
Rand_Sel1=waiting_T(Rand_Ind1,:);
sample_Mu1=mean(Rand_Sel1);
arr_Mu1(i)=sample_Mu1;
end
c1=sort(arr_Mu1);
Exp_Leftconfit_Z=prctile(arr_Mu1,2.5)
Exp_Righconfit_Z=prctile(arr_Mu1,97.5)
Expe_Width_Z=abs(Exp_Leftconfit_Z-Exp_Righconfit_Z)
%Compute a 95% bootstrap confidence interval using all of the data 