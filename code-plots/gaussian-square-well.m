clear all
x = 0:0.01:10; 
%dominio de nuestra funcion 
w= .3;     
#valor para nuestra funcion gaussiana
r = 10;  
#tamaño del pozo 
w1= ((1^2)*(pi^2)/(2*(r^2))); 
w2 = ((2^2)*(pi^2)/(2*(r^2))); 
w3 = ((3^2)*(pi^2)/(2*(r^2))); 
w4 = ((4^2)*(pi^2)/(2*(r^2))); 
w5 = ((5^2)*(pi^2)/(2*(r^2))); 
w6 = ((6^2)*(pi^2)/(2*(r^2))); 
w7 = ((7^2)*(pi^2)/(2*(r^2))); 
w8 = ((8^2)*(pi^2)/(2*(r^2))); 
w9 = ((9^2)*(pi^2)/(2*(r^2))); 
w10 = ((10^2)*(pi^2)/(2*(r^2))); 
#estas fracuencias obtenidas para el pozo si se tiene una masa de la 
%magnitud de la constante de Planck y asi quedandonos nuestras w_i de la manera presentada 
x0= 9; 
%posición inicial
y =  exp(-((x-x0).^2)/(w^2)).*exp(-j*0.01*x);  
%nuestra función gaussiana
t = 0:0.1:100;
a1 = exp(-j*w1.*t);  
a2 = exp(-j*w2.*t); 
a3 = exp(-j*w3.*t);  
a4 = exp(-j*w4.*t);  
a5 = exp(-j*w5.*t);  
a6 = exp(-j*w6.*t);  
a7 = exp(-j*w7.*t);  
a8 = exp(-j*w8.*t);  
a9 = exp(-j*w9.*t);  
a10 = exp(-j*w10.*t);   
%parte para la evolucion temporal 
b1 = sqrt(2/r)*sin(pi*x/r);  
b2 = sqrt(2/r)*sin(2*pi*x/r); 
b3 = sqrt(2/r)*sin(3*pi*x/r); 
b4 = sqrt(2/r)*sin(4*pi*x/r); 
b5 = sqrt(2/r)*sin(5*pi*x/r); 
b6 = sqrt(2/r)*sin(6*pi*x/r); 
b7 = sqrt(2/r)*sin(7*pi*x/r); 
b8 = sqrt(2/r)*sin(8*pi*x/r); 
b9 = sqrt(2/r)*sin(9*pi*x/r); 
b10 = sqrt(2/r)*sin(10*pi*x/r);  
%estados propios del pozo cuadrado 
int1 = 0.01*y*(b1'); 
int2 = 0.01*y*(b2');  
int3 = 0.01*y*(b3');  
int4 = 0.01*y*(b4');  
int5 = 0.01*y*(b5');  
int6 = 0.01*y*(b6');  
int7 = 0.01*y*(b7');  
int88 = 0.01*y*(b8');  
int9 = 0.01*y*(b9');  
int10 = 0.01*y*(b10'); 
%se integro como se vio en clase la funcion gaussiana y los estados propios,
%asi obteniendo el coeficiente correspondiente y al fraficar añadimos la parte temporal de 
% cada estado propio de nuestro pozo cuadrado
p = plot(x,  (abs((int1*(b1.*a1(1)))+ (int2*(b2.*a2(1)))+ (int3*(b3.*a3(1)))+ (int4*(b4.*a4(1))) +(int5*(b5.*a5(1))) +(int6*(b6.*a6(1))) +(int7*(b7.*a7(1))) +(int88*(b8.*a8(1))) +(int9*(b9.*a9(1)))+ (int10*(b10.*a10(1))))).^2, '-b'); 
xlim([0.0, 10]); 
ylim([0, 1]);   
%grafica del modulo cuadrado y la animacion correspondiente
for n = 1:1:100
 set(p, 'YData', (abs((int1*(b1.*a1(n)))+ (int2*(b2.*a2(n)))+ (int3*(b3.*a3(n)))+ (int4*(b4.*a4(n))) +(int5*(b5.*a5(n))) +(int6*(b6.*a6(n))) +(int7*(b7.*a7(n))) +(int88*(b8.*a8(n))) +(int9*(b9.*a9(n)))+ (int10*(b10.*a10(n))))).^2 ); 
 pause(0.05); 
end 
delete(f);  
%RONALDO NAVARRO AMBRIZ 