%% 
% Copyright (C) 2015 Francesco Giovannini
% Authors: Francesco Giovannini <joernano@gmail.com>
% Website: http://www.francescogiovannini.com/
% Permission is granted to copy, distribute, and/or modify this program under the terms of 
% the GNU General Public License, version 2 or any later version published by the Free Software Foundation.
%
% This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even 
% the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
% Public License for more details.
% 

function [res] = LoadBrianSpikes(filename)
%LOADBRIANSPIKES Loads spike data from a saved brian.SpikeMonitor.spikes
%object.
%
% INPUT:
%       filename - The data file containing the brian.SpikeMonitor.spikes
%           object. A brian.SpikeMonitor.spikes contains a list of spike 
%           times for each neuron in the network, in the form:
%               ...
%               (19, 87.1 * ms)
%               (43, 98.5 * msecond)
%               (42, 0.1011 * s)
%               (66, 0.1047 * second)
%               ...
%
%           In order to safely load these values, we must remove all non-numerical
%           charachers from the data before converting it from string to number
%           format.
%
% OUTPUT:
%       res - m-by-2 array of spike times for each neuron in the network
%           where column 1 contains the neuron number and column 2 contains
%           the spike time in milliseconds
%

    %% Load file as string
    fstring = fileread(filename);
    
    %% Remove useless characters
    fstring = strrep(fstring, '(', '');
%     fstring = strrep(fstring, '* s)', '');
    fstring = regexprep(fstring, ' \* s(econd)?\)', 'e3');   % FG: Use regexp to convert units from [s|second] to ms
    fstring = regexprep(fstring, '\* ns(econd)?\)', 'e-6');   % FG: Use regexp to convert units from [ns|nanosecond] to ms
    fstring = regexprep(fstring, '\* ms(econd)?\)', '');   % FG: Use regexp to remove all [ms|msecond], etc.
    fstring = strrep(fstring, ',', '');
    
    %% Convert to numbers
    res = str2num(fstring); % FG: Disregard this MATLAB warning - str2double returns NaN on this data structure!
end