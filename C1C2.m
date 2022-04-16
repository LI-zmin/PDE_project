function out = C1C2(input,K,a1,a2)
out1 = C1(input,K);
out2 = C2(input,K);
out = a1.*out1 + a2.*out2;
end