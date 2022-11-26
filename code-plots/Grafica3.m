clear all  
a0=1;
dR=0.05;
R=0:dR:5;  
%%INTEGRAL TRANSLAPE 11%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%100 100%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for i=1:length(R)
%  h=@(x) ((2/(i/10))*exp(i/10)).*(x-(i/10)+1).*exp(-2 .*x).*x;
%  I3(i)=quad(h,(i/10),120);
%  x=0:0.05:200;
%  I1(i)=0.05*sum(((-20/i)*exp((i/-10))).*(x+(i/10)+1).*exp((-2).*x).*x); 
%  y=0:0.01:(i/10);
%  I2(i)=0.01*sum(((20/i)*exp((i/-10))).*((i/10)-y+1).*y);
%  S(i)=I1(i)+I2(i)+I3(i);
%end    
%%INTEGRAL TRANSLAPE 12%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%100 210%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%210 100%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%for i=1:length(R) 
%  fun = @(theta, r) (1 ./(2*sqrt(2))).*(2-r).*exp(-r/2).*cos(theta).*(exp(-sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta)))).*(r.^2).*sin(theta);
%  rmax = 50; 
%  q(i) = integral2(fun,0,pi ,0,rmax);
%end   
##INTEGRAL TRANSLAPE 22%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%%%%%%%%%%%210 210%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for i=1:length(R) 
%  fun22 = @(theta, r) (1/32*pi).*(2-r).*exp(-r/2).*((cos(theta)).^2).*(2 -sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))).*exp(-sqrt(r.^2+(i/10)^2- 2 .*r.*(i/10).* cos(theta))./2)
%  rmax = 50; 
%  q22(i) = integral2(fun22,0,pi ,0,rmax);
%end     
%%%corroboramos casos limites con R=0 o en numeros grandes
%plot(R, q) 
%plot (R,q22) 
%plot(R,S)  
%%%%%%H1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(R) %hacemos una matriz para cada valor de R hasta Rmax
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
  q(i) = integral2(fun,0,pi ,0,rmax); 
  q22(i) = integral2(fun22,0,pi ,0,rmax);
  H1(1,1,i)=1; 
  H1(1,2,i)=S(i); 
  H1(1,3,i)=0; 
  H1(1,4,i)=q(i); 
  H1(2,1,i)=S(i); 
  H1(2,2,i)=1; 
  H1(2,3,i)=q(i)/4; 
  H1(2,4,i)=0; 
  H1(3,1,i)=0; 
  H1(3,2,i)=q(i)/4; 
  H1(3,3,i)=1/4; 
  H1(3,4,i)=q22(i)/4; 
  H1(4,1,i)=q(i); 
  H1(4,2,i)=0; 
  H1(4,3,i)=q22(i)/4; 
  H1(4,4,i)=1/4;
end   
%%H2$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
for i=1:length(R) %hacemos una matriz para cada valor de R hasta Rmax
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
  q(i) = integral2(fun,0,pi ,0,rmax); 
  q22(i) = integral2(fun22,0,pi ,0,rmax);
  H2(1,1,i)=1/(i/10); 
  H2(1,2,i)=S(i)/(i/10); 
  H2(1,3,i)=0; 
  H2(1,4,i)=q(i)/(i/10); 
  H2(2,1,i)=S(i)/(i/10); 
  H2(2,2,i)=1/(i/10); 
  H2(2,3,i)=q(i)/(i/10); 
  H2(2,4,i)=0; 
  H2(3,1,i)=0; 
  H2(3,2,i)=q(i)/(i/10); 
  H2(3,3,i)=1/(i/10); 
  H2(3,4,i)=q22(i)/(i/10); 
  H2(4,1,i)=q(i)/(i/10); 
  H2(4,2,i)=0; 
  H2(4,3,i)=q22(i)/(i/10); 
  H2(4,4,i)=1/(i/10);
end   
%%H3$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
for i=1:length(R) %hacemos una matriz para cada valor de R hasta Rmax
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
  H3(1,1,i)=D(i); 
  H3(1,2,i)=X(i); 
  H3(1,3,i)=D12(i); 
  H3(1,4,i)=X12(i); 
  H3(2,1,i)=X(i); 
  H3(2,2,i)=D(i); 
  H3(2,3,i)=X12(i); 
  H3(2,4,i)=D12(i); 
  H3(3,1,i)=D12(i); 
  H3(3,2,i)=X12(i); 
  H3(3,3,i)=D2(i); 
  H3(3,4,i)=X22(i); 
  H3(4,1,i)=X12(i); 
  H3(4,2,i)=D12(i); 
  H3(4,3,i)=X22(i); 
  H3(4,4,i)=D2(i);
end  
for i=1:length(R) 
    M(:,i)=eigs(H2(:,:,i)+H1(:,:,i)+H3(:,:,i))
end   
for i=1:length(R) 
    M1(:,i)=eigs(H2(:,:,i)+H1(:,:,i))
end  
%%%%%No estoy seguro de mi termino H3, adjunto 2 graficas, una tomando H3, otra sin H3%%%%%
title('Grafica 3')
hold on 
plot(R,M(1,:))
plot(R,M(2,:)) 
plot(R,M(3,:)) 
plot(R,M(4,:)) 
axis([0 5 -1.5 5]) 
xlabel('radios de Bohr') 
ylabel('multiplos de E1 (energia del estado base del hidrogeno)')
hold off 
%title('Grafica 3(SIN H3)')
%hold on 
%plot(R,M1(1,:))
%plot(R,M1(2,:)) 
%plot(R,M1(3,:)) 
%plot(R,M1(4,:)) 
%axis([0 5 -1.5 5]) 
%xlabel('radios de Bohr') 
%ylabel('multiplos de E1 (energia del estado base del hidrogeno)')
%hold off