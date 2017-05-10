function res = sem(data)
%SEM Compute standard error of the mean from the given data.
%   
% Sem is computed as sigma / sqrt(n) where n is the number of data points.
%
% data is a vector

res = std(data) / sqrt(numel(data));

end

