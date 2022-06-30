function cmap = createColormap(intervals, values)
%
% FUNCTION createColormap
%
% Input Arguments
%
% 1. intervals - if you wish to quantize gray levels 0-30, 31-150, 151-200
% and 201-255 then your intervals would be [30 150 200 255]. These values
% are the last values on each interval that you have.
%
% 2. values - the list of grayscale values that you would like associated
% with each of these intervals. If 0-30 should be quantized as pure black
% (0), 31-150 as light gray (60), 151-200 as dark gray (120) and 201-255 as 
% white (255) then values = [0 60 120 255]
%
% Output Argument
%
% cmap - the resultant colormap that can be applied to the image
%

% input argument checking
if nargin < 1
    % if no input arguments then error
    error('Need at least one input argument');
elseif nargin < 2
    % if only one input argument then second one will be created to be
    % uniform and the same length as intervals
    values = linspace(0, intervals(end), length(intervals));
end

% check that length(interval) = length(values)
if length(intervals) ~= length(values)
    error('Lengths of both input arguments must be equal');
end

% create the quantization map
cmap = zeros(intervals(end)+1, 1);
cmap = [cmap cmap cmap];
for i = 1: length(intervals)
    if i == 1
        start = 1;
    else
        start = intervals(i-1)+2;
    end
    cmap(start:intervals(i)+1, :) = values(i)/values(end);
end

