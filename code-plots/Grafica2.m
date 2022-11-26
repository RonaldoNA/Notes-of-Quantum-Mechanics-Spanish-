clear all  
a0=1;
dR=0.05;
R=0:dR:5;  
%%%%ya usaremos las integrales X,D,S, de cambio, directa y translape, para cada una vemos casos limites
%%como con S en la grafica 1 
for i=1:length(R)  
  h=@(x) ((2/(i/10))*exp(i/10)).*(x-(i/10)+1).*exp(-2 .*x).*x;
  I3(i)=quad(h,(i/10),120);
  x=0:0.05:200;
  I1(i)=0.05*sum(((-20/i)*exp((i/-10))).*(x+(i/10)+1).*exp((-2).*x).*x); 
  y=0:0.01:(i/10);
  I2(i)=0.01*sum(((20/i)*exp((i/-10))).*((i/10)-y+1).*y);
  S(i)=I1(i)+I2(i)+I3(i); 
  fun = @(theta, r) (1 ./(2*sqrt(2))).*(2-r).*exp(-r/2).*cos(theta).*(exp(-sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta)))).*(r.^2).*sin(theta);
  fun22 = @(theta, r) (1/32*pi).*(2-r).*exp(-r/2).*((cos(theta)).^2).*(2 -sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))).*exp(-sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))./2);
  rmax = 50; 
  S12(i) = integral2(fun,0,pi ,0,rmax); 
  S22(i) = integral2(fun22,0,pi ,0,rmax);
  f2=@(x) ((-2/(i/10)).*exp(-(i/10))).*(x+(i/10)+1).*exp(-2 .*x);
  g2=@(x) ((2/(i/10)).*exp(-(i/10))).*((i/10)-x+1);
  h2=@(x) ((2/(i/10))*exp(i/10)).*(x-(i/10)+1).*exp(-2 .*x);
  IX1(i)=integral(f2,0,50000); 
  IX2(i)=quad(g2,0,(i/10));
  IX3(i)=integral(h2,(i/10),1200);
  y=0:0.01:(i/10);
  IX22(i)=0.1*sum(((2/(i/10)).*exp(-(i/10))).*((i/10)-y+1)); 
  X1(i)=(15*IX1(i)+IX22(i)+10*IX3(i))/3;
  X(i)=IX1(i)+IX2(i)+IX3(i);  
  f1=@(x) ((-2/(i/10)).*exp(-(2*i/10))).*(x+(i/10)+(1/2)).*exp(-2 .*x);
  h1=@(x) ((2/(i/10))*exp(2*i/10)).*(x-(i/10)+(1/2)).*exp(-2*x);
  ID1(i)=integral(f1,0,500);
  ID3(i)=integral(h1,(i/10),1200); 
  D(i)=ID1(i)+ID3(i); 
  fun = @(theta, r) (1 ./(2*sqrt(2))).*(2-r).*exp(-r/2).*cos(theta).*(1 ./sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))).*(exp(-r)).*(r.^2).*sin(theta);
  fun22 = @(theta, r) (1/32*pi).*(2-r).*exp(-r/2).*(1 ./sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))).*((cos(theta)).^2).*(2 - r).*exp(-r./2); 
  funX = @(theta, r) (1 ./(2*sqrt(2))).*(2-r).*exp(-r/2).*cos(theta).*(1 ./sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))).*(exp(-sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta)))).*(r.^2).*sin(theta);
  funX22 = @(theta, r) (1/32*pi).*(2-r).*exp(-r/2).*(1 ./sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))).*((cos(theta)).^2).*(2 - sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))).*exp(-(sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta)))./2);
  rmax = 50; 
  D12(i) = integral2(fun,0,pi ,0,5); 
  D2(i) = integral2(fun22,0,pi ,0,5); 
  X12(i)= integral2(funX,0,pi ,0,5);  
  X22(i) = integral2(funX22,0,pi ,0,5); 
  alph(i)=D2(i)+X22(i)-S22(i)/4+1/4+10/i+10*S22(i)/i; 
  bet(i)=-2*D12(i)-2*X12(i)-20*S12(i)/i+5/4*S12(i); 
  c(i)=1 ./((2 .*(1+S(i)))+(2 .*bet(i)./alph(i))+((((bet(i)).^2)./(alph(i)).^2).*(1+S22(i))/2)); 
  d(i)=((bet(i))./((alph(i))*2)).*c(i)/10; 
  H(i)=2*((d(i)).^2).*(alph(i))+2*((c(i)).^2).*(X(i)+D(i)-1-S(i)+10/i+10*S(i)/i)-2*c(i)*d(i)*bet(i);
end   
plot(R,H) 
axis([0 5 -1.5 5]) 
xlabel('radios de Bohr') 
ylabel('multiplos de E1 (energia del estado base del hidrogeno)')