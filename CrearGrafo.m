function [G] = CrearGrafo(numNodos, esP, capacidades, prominimo, promaximo)
%Generacion de matrices de adyacencia aleatorias
G = round(rand(numNodos));%redondeo para obtener o 1 o 0
G = triu(G) + triu(G,1)';%hago que la matriz sea simetrica
G = G - diag(diag(G));%Elimino posibles loops

%Creacion del grafo
G = graph(G);%genero el grafo
%Añado los pesos
numPesos = size(G.Edges.EndNodes);
if esP %Para crear topologias fisicas
    G.Edges.Weight = ones(numPesos(1),1)*100;
    G.Nodes.Size = ones(numNodos,1)*100;
else
    G.Edges.Weight = randi([prominimo,promaximo],numPesos(1),1);
    G.Nodes.Size = capacidades';
end
end