clear all;clc;close all


%initiatilisation de mes valeurs de depart
iterration = 1000;
x=0;
v=0.9;
a=0.1;
vrai_x=0;
vrai_x(1)=0;
vrai_v=0.9;
var_mesure=0.01^2;
dt= 0.1;
pas=20


%initialisation de mes expresion matriciel
X=[x;
   v];
P=eye(2);



%boucle de calcule de notre approximation
for i=0:1:iterration
    
    %changement de vitesse a un moment
    if(i>=iterration/2)
        vrai_v=vrai_v*0.9;
    end
    
    %sauvegarde de de la vitesse pour le graphique apres
    V(i+1)=vrai_v
    
    
    %approximation de la position et de la vitesse
    [X,P,X1(i+1),X2(i+1)]=Approximation(dt,X,P,a);
    
    
    vrai_x(i+2)=vrai_x(i+1)+dt*vrai_v;
    Z=vrai_x(i+2)+rand()*sqrt(var_mesure); %(mes mesures sous perturbation)
    R=var_mesure; %ma perturbation (le bruit)
    
    %appriximation ideal en utilisant les mesures
    if(i ~=0 && mod(i,pas) == 0)
        [X,P,X1(i+1),X2(i+1)]=mesure(X,P,Z,R);
    end
end

figure(1);
subplot(2,1,1);
%approximation de la position
plot(X1)
hold on
%comparaison avec ma vrai position
plot(vrai_x)

title("position")

subplot(2,1,2);
%approximation de la vitesse
plot(X2)
hold on
%comparaison avec ma vrai vitesse
plot(V)
title("vitesse")



