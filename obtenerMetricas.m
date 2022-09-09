function [revenue, total_eMMB, total_mMTC, total_URLLC] = obtenerMetricas(matrizActivos, trafico)
%Revenue
dimActivos = size(matrizActivos);
filasActivos = dimActivos(1);
columnasActivos = dimActivos(2);

sumatoriaCPUPorTiempos = zeros(1,filasActivos);
cpuPorSolicitud = zeros(1, columnasActivos);

sumatoriaLINKPorTiempos = sumatoriaCPUPorTiempos;
total_eMMB = sumatoriaCPUPorTiempos;
total_mMTC = sumatoriaCPUPorTiempos;
total_URLLC = sumatoriaCPUPorTiempos;

linkPorSolicitud = cpuPorSolicitud;

contador_eMMB = 0;
contador_mMTC = 0;
contador_URLLC = 0;

for i=1:filasActivos
    for j=1:columnasActivos
        if matrizActivos(i,j) ~= 0
            % Para el CPU
            MatrizcpuUsado = trafico(matrizActivos(i,j)).grafo.Nodes.Size;
            cpuPorSolicitud(j) = sum(MatrizcpuUsado); %sumo las capacidades solicitadas por cada nodo de cada solicitud
            %Para los links
            MatrizlinkUsado = trafico(matrizActivos(i,j)).grafo.Edges.Weight;
            linkPorSolicitud(j) = sum(MatrizlinkUsado);
            %verifico que tipos de trafico se clasifican
            QoStrafico = trafico(matrizActivos(i,j)).nombre;
            switch QoStrafico
                case 'eMMB'
                    contador_eMMB = contador_eMMB + 1;
                case 'mMTC'
                    contador_mMTC = contador_mMTC + 1;
                case 'URLLC'
                    contador_URLLC = contador_URLLC + 1;
            end
        end
    end
    if matrizActivos(i,1) ~= 0
        sumatoriaCPUPorTiempos(i) = sum(cpuPorSolicitud);%sumo las capacidades de todas las solicitudes en un tiempo
        sumatoriaLINKPorTiempos(i) = sum(linkPorSolicitud);
        total_eMMB(i) = sum(contador_eMMB);
        total_mMTC(i) = sum(contador_mMTC);
        total_URLLC(i) = sum(contador_URLLC);
    end
    contador_eMMB = 0;
    contador_mMTC = 0;
    contador_URLLC = 0;
end
revenue = sumatoriaCPUPorTiempos + sumatoriaLINKPorTiempos;
%Normalizar con respecto a la topologia fisica
%Considerar cuando se liberan y se rechazan a la vez
%Acceptance Ratio, en este caso es de todo el sistema

