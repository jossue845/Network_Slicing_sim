function [existe] = BuscarAristaNula(tp)
if (length(tp.Edges.Weight) < length(tp.Nodes.Size)-1)
    existe = 1;
else
    existe = 0;
end