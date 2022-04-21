function it = It(img,dx,dy,K)
ix = Ix(img,dx);
iy = Iy(img,dy);
ixx = Ixx(img,dx);
iyy = Iyy(img,dy);
ixy = Ixy(img,dx,dy);
dn = sqrt(ix.^2+iy.^2); % div of the norm

One = ones(size(img));
kk = K^2;
it = exp(-dn.^2./kk).*(ixx.*(One-2.*ix.^2./kk) - (4/kk).*ix.*iy.*ixy + iyy.*(One-2.*iy.^2./kk));
end