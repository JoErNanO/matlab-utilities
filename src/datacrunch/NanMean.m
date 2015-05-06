function [res] = NanMean(data, varargin)
%NANMEAN Compute the mean of the given matrix, disregarding elements
%containing NaN's.
%
% INPUT:
%       data - m-by-n data matrix
%       varargin - variable number of positional arguments containing
%           (1) dimension along with to compute the mean (see help MEAN) for
%               more details
%           
% OUTPUT:
%       res - 
%           1-by-n vector of mean values if varargin(1) == 1
%           m-by-1 vector of mean values if varargin(1) == 2
%

if isempty(varargin)
    dim = 1;
else
    dim = varargin{1};
end

switch dim
    case 1
        % Column-wise mean
        res = MeanCol(data);
    case 2
        % Row-wise mean
        res = MeanRow(data);
    otherwise
        error('NanMean:InvalidDimension', 'Invalid dimension provided.');
end

end

function mu = MeanRow(data)

    % Preallocate resulting mean vector
    nRows = size(data, 1);
    mu = zeros(nRows, 1);

    for row = 1:nRows
        mu(row) = mean(data(row, ~isnan(data(row, :))));
    end

end

function mu = MeanCol(data)

    % Preallocate resulting mean vector
    nCols = size(data, 2);
    mu = zeros(1, nCols);

    % Compute means
    for col = 1:nCols
        mu(col) = mean(data(~isnan(data(:, col)), col));
    end

end