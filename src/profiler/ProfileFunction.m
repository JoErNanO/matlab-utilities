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

function [res] = ProfileFunction(dir, f_handle, varargin)
%PROFILEFUNCTION Profile the given function.
%Runs the profiler on the given function with arguments specified by
%varargin.
%
%Profile results are stored in ./profile_results/dir where dir is the given
%directory path.
%
% Input:
%           dir - Where to store profile results
%
%           f_handle - Function handle to profile
%
%           varargin - Function arguments
%
% Output:
%           res - Result data structure containing function call output
%

    profile on -history;
    res = f_handle(varargin{:});
    profile viewer;
    p = profile('info');
    profsave(p, strcat('profile_results/',dir));

end
