%% Programa que obtiene la función de transferencia

%1 - Creamos nuestras variables y asignamos valores
r = 1;

J1 = .4;
J2 = .4;
D1 = 1;

Ft = 1;

N1 = 1;
N2 = 1;
N12 = N1/N2;

N21 = N2/N1;

N21_sqr = N21^2;

%1.1 - Organizo todas las operaciones para ingresarlas a la tf

coef_r = r;
Jeq = J1+J2(N21_sqr); %Esto es para el diagrama de bloques
coef_S2 = N12*(Jeq);
Deq = D1+Ft(N21_sqr); %Esto es para el diagrama de bloques
coef_S = Deq;

%Unicamente para el diagrama de bloques
%Diagrana de bloques 1
Deq_normalizado = N12*Deq;
Jeq_normalizado = N12*Jeq;
%Diagrama de bloques 2

%1.2 - Aquí normalizo por eso divido todo entre coef_S2
num = [coef_r/coef_S2]; %Defino el numerado 
den = [coef_S2/coef_S2 coef_S/coef_S2]; %Defino el denominador

%1.3 tf continua y discreta
%Ya conozco num y den
G = tf(num,den); %Defino mi función de transferencia continua
%----No tengo num_discreto y den_discreto
%----debo discretizar y luego obtener num_d y den_d

%Creo una copia de tf
G_discreta_tf= tf(num,den); %Defino mi función de transferencia discreta
T = 0.5; %Tiempo
G_discreta = c2d(G_discreta_tf ,T, 'matched'); %foh
G_discreta_2 = c2d(G_discreta_tf ,T, 'matched');

%1.4 Obtengo matrices para tiempo continuo y discreto
[A,B,C,D] = ssdata(G); %Defino mi espacio de estados continuo
[AA,BB,CC,DD] = ssdata(G_discreta); %Defino mi espacio de estados discreto

[num_d den_d] = tfdata(G_discreta_2, 'v');

%imprimo tf continua y disreta
impulse(G,'-',G_discreta,'--');
