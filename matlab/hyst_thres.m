%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  function  edges = hyst_thres(E, low, high)
%  purpose :    hysteresis thresholding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input   arguments
%     E:    edge image, dimensions = m x n, (m = no. of rows, n = no. of columns)
%     low:  lower hysteresis threshold
%     high: higher hysteresis threshold
%  output   arguments
%     edges:     edge image with hysteresis thresholding applied
%
%   Author: Johan Lewenhaupt
%   MatrNr: 1624242
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function edges = hyst_thres(E, low, high)

[row,col] = size(E);
M = max(E(:));
Norm_E = E./M;

for r = 1:row
    for c = 1:col
        if Norm_E(r,c)<low
            Norm_E(r,c) = 0;
        end
        if Norm_E(r,c)>high
            Norm_E(r,c) = 1;
        end
        if Norm_E(r,c)<high && Norm_E(r,c)>low
            Norm_E(r,c) = 2;
        end
    end
end
build_edges=1;
while build_edges==1
    build_edges=0;
    for r = 2:row-1
        for c = 2:col-1
            if Norm_E(r,c)==2
                if Norm_E(r-1,c)==1 || Norm_E(r+1,c)==1 || Norm_E(r,c-1)==1 || Norm_E(r,c+1)==1 || Norm_E(r-1,c-1)==1 || Norm_E(r+1,c+1)==1
                    Norm_E(r,c) = 1;
                    build_edges=1;
                end
            end
        end
    end
end
for r = 2:row-1
    for c = 2:col-1
        if Norm_E(r,c)==2
            if Norm_E(r-1,c)==1 || Norm_E(r+1,c)==1 || Norm_E(r,c-1)==1 || Norm_E(r,c+1)==1 || Norm_E(r-1,c-1)==1 || Norm_E(r+1,c+1)==1
                Norm_E(r,c) = 0;
            end
        end
    end
end
edges = Norm_E; % <<< Remove this line before you start
