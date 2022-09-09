function [tp] = LiberarRecursos(tp,tr, posiciones)
memaristas = [];
for i=1:length(posiciones) %busco y asigno en los nodos
    pfisica = tp.Nodes.Size(posiciones(i));
    pr = tr.Nodes.Size(i);
    tp.Nodes.Size(posiciones(i)) = pfisica + pr;
end
EndNodesMatriz = tp.Edges.EndNodes;%busco y asigno en las aristas
for j=1:length(posiciones)-1 %Inicio la busqueda de las aristas solicitadas dentro de la topologia fisica
    [indiceArista] = BuscarPar(EndNodesMatriz, posiciones(j), posiciones(j+1));
    memaristas = [memaristas, indiceArista];
    tp.Edges.Weight(indiceArista) = tp.Edges.Weight(indiceArista) + tr.Edges.Weight(j);
end
end