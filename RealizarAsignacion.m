function [tp,rechazados, aceptados, trafico, rechazo, solicitudRechazada] = RealizarAsignacion(tp, k, rechazados, aceptados, trafico, dMaxSolicitudes)

solicitudRechazada = [];
[traficoIndividual, posiciones] = SolicitarTrafico(tp.grafo,k, dMaxSolicitudes);%el valor de k da el tiempo en el que se esta ejecutando y la iteracion en la que va
nodoEscondido = verificarNodoOculto(traficoIndividual.grafo);
while isempty(traficoIndividual.grafo.Edges) || BuscarAristaNula(traficoIndividual.grafo) || nodoEscondido %Verifico que se genere una topologia con vertices
    [traficoIndividual, posiciones] = SolicitarTrafico(tp.grafo,k, dMaxSolicitudes);
    nodoEscondido = verificarNodoOculto(traficoIndividual.grafo);
end
[tp.grafo, cumple] = Mapeo(tp.grafo, traficoIndividual.grafo, posiciones);
if ~cumple
    fprintf("************************\n" + ...
        "No se puede asignar la capacidad solicitada RECHAZO\n" + ...
        "************************\n")
    rechazados = rechazados + 1;
    rechazo = 1;
    solicitudRechazada = traficoIndividual;
else
    rechazo = 0;
    aceptados = aceptados + 1;
    trafico = [trafico, traficoIndividual];
end
end