clc
close all
clear all

% -------- load img -----------
img_ref = rescale(double(rgb2gray(imread('daisy.jpeg')))); % divide 255 because imshow only show double of [0,1]
% img_ref = rescale(double((imread('scan1.jpeg')))); % divide 255 because imshow only show double of [0,1]

% ----------- add noise -----------
guassian_noise = rand(size(img_ref))./2;
img_noised = rescale(img_ref+guassian_noise);

%% ------------ loop ---------------
img = img_noised;

dx = 2; % should be integers, cause they are pixels
dy = 2;
dt = CFL(dx,dy);
K = 0.1;
T = 10;
nb = 4; % number of plot that we want
PSNR_list = zeros(1,T+1);
PSNR_list(1) = psnr(img_noised, img_ref);

figure
imshow(img_ref);
title('original')

figure
imshow(img_noised);
title('noised')


for j = 2:T+1    
    it = It(img,dx,dy,K);
%     img = rescale(img + dt.*it);
    img = (img + dt.*it);
    
    if mod(j,ceil(T/nb))==0
        figure
        imshow(img)
        title(sprintf('K=%.2f , %d iteration',K,j))
    end
    
    PSNR = psnr(img, img_ref);
    PSNR_list(j) = PSNR;
end


figure
stem(PSNR_list)
title('variation of PSNR')
%%

