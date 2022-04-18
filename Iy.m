% given the input img and the dx, we compute the Ix using
% Iy = (I(x,y+dy,t)-I(x,y-dy,t))/2dy

% todo: for the pixels in the two extrem, maybe use forward or backward to
% update

function out = Iy(I, dy)
Iplus = I(1:end-2*dy,:);
Iminus = I(2*dy+1:end,:);

out = I;
out(dy+1:end-dy,:) = (Iplus-Iminus)./(2*dy);
end
