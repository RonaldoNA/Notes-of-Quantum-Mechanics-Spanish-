clear all   
%%%%%%%%%%INTEGRAL DE TRANSLAPE%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%100 100%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a0=1;
dR=0.05;
R=0:dR:5; 
for i=1:length(R)
  h=@(x) ((2/(i/10))*exp(i/10)).*(x-(i/10)+1).*exp(-2 .*x).*x;
  I3(i)=quad(h,(i/10),120);
  x=0:0.05:200;
  I1(i)=0.05*sum(((-20/i)*exp((i/-10))).*(x+(i/10)+1).*exp((-2).*x).*x); 
  y=0:0.01:(i/10);
  I2(i)=0.01*sum(((20/i)*exp((i/-10))).*((i/10)-y+1).*y);
  I(i)=I1(i)+I2(i)+I3(i);
  A1(i)=1/(2+2*(I(i))); %Constante de normalización caso simetrico
  A2(i)=1/(2-2*(I(i)));   %Constante de normalización caso antisimetrico
end   
%%%%%%%CORROBORAMOS QUE TENEMOS LAS GRAFIACAS CORRESPONDIENTES
%%%%%%PARA LAS CONSTANTES DE NORMALIZACIÓN EN AMBOS CASOS
%%%%%%%%%plot(R,A); 
%%%%%%%%%%INTEGRAL DIRECTA 1/R_1 , 1/R_2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
for i=1:length(R) 
  f1=@(x) ((-2/(i/10)).*exp(-(2*i/10))).*(x+(i/10)+(1/2)).*exp(-2 .*x);
  h1=@(x) ((2/(i/10))*exp(2*i/10)).*(x-(i/10)+(1/2)).*exp(-2*x); 
  ID1(i)=integral(f1,0,500);
  ID3(i)=integral(h1,(i/10),1200); 
  D(i)=ID1(i)+ID3(i);
end  
%%%%%%%%%INTEGRAL DE CRUCE
for i=1:length(R)
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
end 
for i=1:length(R) 
  H1(i)=(20/i)-2*(A1(i)*(D(i)+X1(i)))-1 
  H2(i)=(20/i)-2*(A2(i)*(D(i)-X(i)))-1
end  
title('Grafica 1')
hold on 
plot(R,H1)
plot(R,H2) 
axis([0 5 -1.5 5]) 
xlabel('radios de Bohr') 
ylabel('multiplos de E1 (energia del estado base del hidrogeno)')
hold off