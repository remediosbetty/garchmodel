strikes=linspace(0.8,1.2,11);
volvols=(0.1:0.1:0.4);
styleV={('-'),('--'),('-.'),(':')};
colourV={('k'),('b'),('r'),('m')};
prices=zeros(4,11);
pricem=zeros(4,11);
volatility=zeros(4,11);
for i=1:4
    for j=1:11
        pricem(i,j)=hestoncallquad(2,0.04,volvols(i),0.5,0.04,0.01,1,1,strikes(j));
        price=max(pricem(i,j),0);
        prices(i,j)=price;
        volatility(i,j)=blsimpv(1,strikes(j),0.01,1,price);
    end
    plot(strikes,volatility(i,:),[char(colourV(i)),char(styleV(i))]);
    ylabel('implied volatiolity');
    xlabel('strike price');
    title('\rho=0.5');
    hold on
end
legend('\sigma=0.1','\sigma=0.2','\sigma=0.3','\sigma=0.4')
figure;
for i=1:4
    for j=1:11
        pricem(i,j)=hestoncallquad(2,0.04,volvols(i),0,0.04,0.01,1,1,strikes(j));
        price=max(pricem(i,j),0);
        prices(i,j)=price;
        volatility(i,j)=blsimpv(1,strikes(j),0.01,1,price);
    end
        plot(strikes,volatility(i,:),[char(colourV(i)),char(styleV(i))]);
        ylabel('implied volatiolity');
        xlabel('strike price');
        title('\rho=0');
    hold on
end
legend('\sigma=0.1','\sigma=0.2','\sigma=0.3','\sigma=0.4')
figure;

for i=1:4
    for j=1:11
        pricem(i,j)=hestoncallquad(2,0.04,volvols(i),-0.5,0.04,0.01,1,1,strikes(j));
        price(i,j)=max(pricem(i,j),0);
        volatility(i,j)=blsimpv(1,strikes(j),0.01,1,prices(i,j));
    end
        plot(strikes,volatility(i,:),[char(colourV(i)),char(styleV(i))]);
        ylabel('implied volatiolity');
        xlabel('strike price');
        title('\rho=-0.5');
    hold on
end
legend('\sigma=0.1','\sigma=0.2','\sigma=0.3','\sigma=0.4')
figure;