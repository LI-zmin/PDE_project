clc
close all
clear all

% -------- load img -----------
% img_ref = rescale(double(rgb2gray(imread('scan2.jpeg')))); % divide 255 because imshow only show double of [0,1]
img_ref = rescale(double((imread('scan1.jpeg')))); % divide 255 because imshow only show double of [0,1]

% ----------- add noise -----------
guassian_noise = rand(size(img_ref))./2;
img_noised = rescale(img_ref+guassian_noise);

%% ------------ loop ---------------
img = img_noised;

dx = 15;
dy = 15;
dt = 0.1;
K = 1;
T = 500;
PSNR_list = zeros(1,T+1);
PSNR_list(1) = psnr(img_noised, img_ref);

for j = 2:T+1
    
    ix = Ix(img,dx);
    iy = Iy(img,dy);
    ixx = Ixx(img,dx);
    iyy = Iyy(img,dy);
    ixy = Ixy(img,dx,dy);
    div_norm = sqrt(ix.^2+iy.^2);
    
    it = exp(-(div_norm./K).^2).*(ixx.*(ones(size(img))-ix.^2) - (2).*ix.*iy.*iyy + iyy.*(ones(size(img))-iy.^2));

    img = rescale(img + dt.*it);
    
    PSNR = psnr(img, img_ref);
    PSNR_list(j) = PSNR;
end

figure
subplot(131)
imshow(img_ref);
title('without noise')
subplot(132)
imshow(img_noised);
title('with noise')
subplot(133)
imshow(img);
title(strcat('after ',num2str(j),' iteration of PM algo'))

figure
stem(PSNR_list)
title('variation of PSNR')
%%

