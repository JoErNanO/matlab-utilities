%% 
% Copyright (C) 2014 Francesco Giovannini
% Authors: Francesco Giovannini <joernano@gmail.com>
% Website: http://www.francescogiovannini.com/
% Permission is granted to copy, distribute, and/or modify this program under the terms of 
% the GNU General Public License, version 2 or any later version published by the Free Software Foundation.
%
% This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even 
% the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
% Public License for more details.
% 

function tm = TimeUnix2Matlab(tu)
%TIMEUNIX2MATLAB Convert the given UNIX timestamp into a MATLAB timestamp.
%
% The UNIX timestamp represents the number of seconds elapsed between now and
% the 1st January 1970.
%

    %% Convert UNIX timestamp to MATLAB
    tm = datenum('1970', 'yyyy') + tu / 8.64e4;

end
