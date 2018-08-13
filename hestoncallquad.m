function call=hestoncallquad(kappa,theta,sigma,rho,v0,r,T,s0,K)
warning off
call=s0*hestonp(kappa,theta,sigma,rho,v0,r,T,s0,K,1)-K*exp(-r*T)*hestonp(kappa,theta,sigma,rho,v0,r,T,s0,K,2);
function ret=hestonp(kappa,theta,sigma,rho,v0,r,T,s0,K,type)
ret=0.5+1/pi*quadl(@hestonpintegrand,0,100,[],[],kappa,theta,sigma,rho,v0,r,T,s0,K,type);
function ret=hestonpintegrand(phi,kappa,theta,sigma,rho,v0,r,T,s0,K,type)
ret=real(exp(-1i*phi*log(K)).*hestf(phi,kappa,theta,sigma,rho,v0,r,T,s0,type)./(1i*phi));

function f=hestf(phi,kappa,theta,sigma,rho,v0,r,T,s0,type)
if type==1;
    u=0.5;
    b=kappa-rho*sigma;
else
    u=-0.5;
    b=kappa;
end
a=kappa*theta;
x=log(s0);
d=sqrt((rho*sigma*phi.*1i-b).^2-sigma^2*(2*u*phi.*1i-phi.^2));
g=(b-rho*sigma*phi*1i+d)./(b-rho*sigma*phi*1i-d);
C=r*phi.*1i*T+a/sigma^2.*((b-rho*sigma*phi*1i+d)*T-2*log((1-g.*exp(d*T))./(1-g)));
D=(b-rho*sigma*phi*1i+d)./sigma^2.*((1-exp(d*T))./(1-g.*exp(d*T)));
f=exp(C+D*v0+1i*phi*x);