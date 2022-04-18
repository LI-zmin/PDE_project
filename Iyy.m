function out = Iyy(I,dy)
Iplus = I(1:end-2*dy,:);
Iminus = I(2*dy+1:end,:);

out = I;
out(dy+1:end-dy,:) = (Iplus-2*I(dy+1:end-dy,:)+Iminus)./(dy^2);
end
