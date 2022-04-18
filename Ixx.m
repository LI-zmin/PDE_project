% given the input img and the dx, we compute the Ix using
% Ix = (I(x+dx,y,t)-2I(x,y,t+)I(x-dx,y,t))/dx^2

% todo: for the pixels in the two extrem, maybe use forward or backward to
% update

function out = Ixx(I, dx)
Iplus = I(:,1:end-2*dx);
Iminus = I(:,2*dx+1:end);

out = I;
out(:,dx+1:end-dx) = (Iplus-2*I(:,dx+1:end-dx)+Iminus)./(dx^2);
end
