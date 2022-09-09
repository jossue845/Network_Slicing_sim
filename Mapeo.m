function [tp, cumple] = Mapeo(tp,tr, posiciones)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Se aniaden mas variables de entrada      %
%  ahora se debe saber la localizacion de los  %
%               nodos requeridos               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%tp = topologia fisica
%tr = topologia que se requiere virtualizar
%cF1 = capacidad final 1
%cF1 = capacidad final 2
%prn1 = procesamiento nodo elegido 1 de la tp
%prn2 = procesamiento nodo elegido 2 de la tp
%pren = procsamiento del enlace elegido
%cumple = boolean con valor 1 si hay capacidad
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Adicion                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%posiciones = vector con las posiciones de los nodos requeridos

%algoritmo de mapeo
% numPesos = size(tp.Edges.EndNodes);
% for i=1:numPesos(1)
%     tp.Edges.Weight
% end
cumple2 = 0;
%memaristas = [];
%%%%%%%%%%%%%%%%%%%%%%  VNE descoordiando %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Revision de la capacidad por nodos
for i=1:length(posiciones)
    pfisica = tp.Nodes.Size(posiciones(i));
    pr = tr.Nodes.Size(i);
    if (pfisica < pr)
        fprintf("No se tiene capacidad en el nodo %d\n", posiciones(i))
        cumple1 = 0;
        break
    else
        cumple1 = 1;
    end
end
EndNodesMatriz = tp.Edges.EndNodes;
%Revision de la capacidad por enlaces
for j=1:length(posiciones)-1 %Inicio la busqueda de las aristas solicitadas dentro de la topologia fisica
    %pasar posiciones directamente
    [indiceArista] = BuscarPar(EndNodesMatriz, posiciones(j), posiciones(j+1));
    valorAdisminuir = tp.Edges.Weight(indiceArista) - tr.Edges.Weight(j);
    if (valorAdisminuir < 0 || ~cumple1)
        fprintf("No se tiene capacidad en la arista entre los nodos %d y %d\n", posiciones(j), posiciones(j+1))
        cumple2 = 0;
        break
    else
        cumple2 = 1;  
    end
end
if cumple1 && cumple2
    for i=1:length(posiciones)
        pfisica = tp.Nodes.Size(posiciones(i));
        pr = tr.Nodes.Size(i);
        tp.Nodes.Size(posiciones(i)) = pfisica - pr;
    end
    for j=1:length(posiciones)-1
        [indiceArista] = BuscarPar(EndNodesMatriz, posiciones(j), posiciones(j+1));
        valorAdisminuir = tp.Edges.Weight(indiceArista) - tr.Edges.Weight(j);
        tp.Edges.Weight(indiceArista) = valorAdisminuir;
        %memaristas = [memaristas, indiceArista];
    end
    cumple = 1;
else
    cumple = 0;
end

end