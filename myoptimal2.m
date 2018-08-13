function optimal=myoptimal2(M_input)
%K is a vector of strike prices
%T is a vector of maturities
%beta0,beta1,beta2,lath are parameters
beta0=M_input(1);
beta1=M_input(2);
beta2=M_input(3);
lath=M_input(4);
K1=(2.2:0.05:2.6);
K2=(2.2:0.05:2.6);
K3=(2.2:0.05:2.9);
K4=(2.15:0.05:2.65);
T=[22,50,78,169];
x=[0.135109771000000,0.166505881000000,0.183927191000000,0.207956267000000,0.221088707000000,0.229959311000000,0.241303754000000,0.253534278000000,0.259447443000000,0.132177031000000,0.161393035000000,0.184451597000000,0.201220462000000,0.209180533000000,0.220201073000000,0.232706737000000,0.242322554000000,0.250679980000000,0.129203571000000,0.140932652000000,0.164501006000000,0.175518488000000,0.198092513000000,0.204115333000000,0.219788144000000,0.222751602000000,0.238533234000000,0.235841366000000,0.248991712000000,0.254417609000000,0.262208760000000,0.265917410000000,0.271588324000000,0.272872264000000,0.0857720800000000,0.127265046000000,0.148674721000000,0.163403261000000,0.183073034000000,0.188852041000000,0.198297910000000,0.190974491000000,0.215000370000000,0.211251153000000,0.218432922000000]
[~,col0]=size(x);
[~,col1]=size(K1);
[~,col2]=size(K2);
[~,col3]=size(K3);
[~,col4]=size(K4);
s1=0;
s2=0;
s3=0;
s4=0;
for i=1:col1
    %sigma1=zeros(1,col1);
    s1=s1+abs(mybeta2([beta0;beta1;beta2;lath;T(1);K1(i)])-x(i));
    %s1=s1+abs(sigma1(i)-x(i));
end
for i=1:col2
    %sigma2=zeros(1:col2);
    s2=s2+abs(mybeta2([beta0;beta1;beta2;lath;T(2);K2(i)])-x(i+col1));
end
for i=1:col3
    %sigma3=zeros(1:col3);
    s3=s3+abs(mybeta2([beta0;beta1;beta2;lath;T(3);K3(i)])-x(i+col1+col2));
    %s3=s3+abs(sigma3(i)-x(i+col1+col2));
end
for i=1:col4
    %sigma4=zeros(1:col4);
    s4=s4+abs(mybeta2([beta0;beta1;beta2;lath;T(4);K4(i)])-x(i+col1+col2+col3));
    %s4=s4+abs(sigma4(i)-x(i+col1+col2+col3));
optimal=(s1+s2+s3+s4)/col0;
end
end