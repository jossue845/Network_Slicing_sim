function [nodoT, posiciones] = SolicitarTrafico(tp, tiempoInicial, dMaxSolicitudes)
%Se plantea una topologia mas pequeña que la topologia principal
nodos = randi([2 3], 1,1);
%capacidades y enlaces de acuerdo al tipo de trafico
capacidades = zeros(1,nodos);
tipoTrafico = randi([1 3], 1,1);
switch tipoTrafico
    case 1 %eMBB
        minimo = 30;
        pico = 40;
        nombre = 'eMMB';
        prominimo = 10;
        promaximo = 20;
    case 2 %mMTC
        minimo = 1;
        pico = 2;
        nombre = 'mMTC';
        prominimo = 1;
        promaximo = 5;
    case 3 %URLLC
        minimo = 1;
        pico = 25;
        nombre = 'URLLC';
        prominimo = 30;
        promaximo = 40;
end

for n=1:nodos
    capacidades(n) = randi([prominimo promaximo], 1,1);%Se solicita como porcetanje
end
        
grafo = CrearGrafo(nodos, 0, capacidades, minimo, pico);
posiciones = BuscarCamino(tp, nodos);
tiempoVida = randi([2 dMaxSolicitudes], 1,1);
nodoT = struct( ...
    'grafo', grafo, ...
    'nombre', nombre, ... %Para las calidades de servicio
    'posiciones', posiciones, ...
    'tiempoVida', tiempoVida, ...
    'tiempoInicial', tiempoInicial);
end