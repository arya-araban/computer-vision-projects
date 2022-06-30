function [output] = lfilter(m,n,r1,r2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    u = [0:(m-1) -m:-1]
    v = [0:(n-1) -n:-1]
    [V,U] = meshgrid(v,u);
    D = v.^2 + U.^2;
    output = ones(size(D));
    output(D<r2 | 
end

