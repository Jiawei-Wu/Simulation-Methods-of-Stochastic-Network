Run('µã»÷¿ªÊ¼');
nReps = 10000;
n1 = 30;            %sample size 1
n2 = 15;            %sample size 2
alpha = .05;        %alpha value
x1 = randn(n1,1);
x2 = randn(n2,1);
myStatistic = @(x1,x2) mean(x1)-mean(x2);

sampStat = myStatistic(x1,x2);
bootstrapStat = zeros(nReps,1);
for i=1:nReps
    sampX1 = x1(ceil(rand(n1,1)*n1));
    sampX2 = x2(ceil(rand(n2,1)*n2));
    bootstrapStat(i) = myStatistic(sampX1,sampX2);
end
CI = prctile(bootstrapStat,[100*alpha/2,100*(1-alpha/2)]);
xx = min(bootstrapStat):.01:max(bootstrapStat);
hist(bootstrapStat,xx);