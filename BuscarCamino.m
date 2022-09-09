function [posiciones] = BuscarCamino(G, nodos)
numnodos = length(G.Nodes.Size);
posiciones = [];
while isempty(posiciones)  
    var_aleatoria = randi([1 numnodos], 1);
    for i=1:numnodos
        for j=var_aleatoria:numnodos
            if (j == i) %ningun nodo tiene un loop
                break
            end
            paths = shortestpath(G,j,i, 'Method','positive');
            if (length(paths) == nodos)
                posiciones = paths;
                return
            end
        end
    end
end
end