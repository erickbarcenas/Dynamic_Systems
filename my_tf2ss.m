%% Programa que obtiene la funci�n de transferencia

r = 1;

J1 = 1;
J2 = 1;
D1 = 1;

Ft = 1;

N1 = 1;
N2 = 1;
N12 = N1/N2;

N21 = N2/N1;

N21_sqr = N21^2;

%Organizo todas las operaciones para ingresarlas a la tf
coef_r = r;
coef_S2 = N12*(J1+J2(N21_sqr));
coef_S = D1+Ft(N21_sqr);

%Aqu� debo de normalizar por eso divido todo entre coef_S2
num = [coef_r/coef_S2]; %Defino el numerado 
den = [coef_S2/coef_S2 coef_S/coef_S2]; %Defino el denominador
G = tf(num,den) %Defino mi funci�n de transferencia
%[A,B,C,D] = ssdata(G); %Defino mi espacio de estados
sys = ss(G);
step(sys);
