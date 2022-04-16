function out = C1(input,K)
out = 1./(1+abs(input).^2./K);
end