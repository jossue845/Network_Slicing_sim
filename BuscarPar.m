function [encontrado] = BuscarPar(EndNodes, ppar, spar)
dimensionesMatriz = size(EndNodes);
numfilas = dimensionesMatriz(1);
encontrado1 = find(EndNodes==ppar);
encontrado2 = find(EndNodes==spar);
for i=1:length(encontrado1)
    for j=1:length(encontrado2)
        if (encontrado2(j) == encontrado1(i) + numfilas)
            encontrado = encontrado1(i);
            return
        elseif (encontrado2(j) == encontrado1(i) - numfilas)
            encontrado = encontrado2(j);
            return
        end
    end
end
end