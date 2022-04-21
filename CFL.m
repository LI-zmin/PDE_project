% given the dx, dy, we want to find the dt
% which obays CFL condition

function dt = CFL(dx,dy)

d = min(dx,dy); % dx and dy appear in the numerator, so we should use the minimum of the two
bound1 = d^2/4; % cause dt<=d^2/4|b|, |b| here is |exp(-(Ix^2+Iy^2)/k^2)|<=1
bound2 = d/sqrt(2);

dt = min(bound1,bound2)/5;
end