function [callpricef,sigmaf]=mybeta4(beta0,beta1,beta2,lath,T,K)
%beta0=m_input(1);
%beta1=m_input(2);
%beta2=m_input(3);
%lath=m_input(4);
%T=m_input(5);
%K=m_input(6);
sigma0=0.19319;
%K=(2.15:0.05:2.9);
%[~,col]=size(K);
%T=78;
%K=2.07;
sigmasqrt0=sigma0^2;
r=0.043;
S0=2.301;
St=zeros(100000,T);
sigmac=zeros(100000,T);%sigma
sigmasqrt=zeros(100000,T);%sigma^2
delta0=randn(1,1);delta=randn(100000,T);

%for k=1:col
    %callprice_final=zeros(1,k);
    %sigmam=zeors(1,k);
    %callpricef=zeros(1,k);
for i=1:100000
    sigmasqrt(i,1)=beta0+beta1*sigmasqrt0/252+beta2*sigmasqrt0/252*(delta0-lath)^2;%the estimation of first-order sigma^2
    sigmac(i,1)=sqrt(sigmasqrt(i,1));%the estimation of first-order sigma
    St(i,1)=exp(log(S0)+r-0.5*sigmasqrt(i,1)+sigmac(i,1)*delta(i,1));
    for j=2:T
        sigmasqrt(i,j)=beta0+beta1*sigmasqrt(i,j-1)+beta2*sigmasqrt(i,j-1)*(delta(i,j-1)-lath)^2;
        sigmac(i,j)=sqrt(sigmasqrt(i,j));
        St(i,j)=exp(log(St(i,j-1))+r/252-0.5*sigmasqrt(i,j)+sigmac(i,j)*delta(i,j));
    end
end