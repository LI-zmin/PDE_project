function out = Ixy(I,dx,dy)
Itl = I(1:end-2*dy,1:end-2*dx); % top left, which is xplus, y plus
Itr = I(1:end-2*dy,2*dx+1:end);
Ibl = I(2*dy+1:end,1:end-2*dx); % bottom left
Ibr = I(2*dy+1:end,2*dx+1:end);

out = I;
out(2*dy+1:end,2*dx+1:end) = -(Itl+Ibr-Itr-Ibl)./(4*dx*dy);
end