clear all
close all

% Q1: Constrained least-squares filter
% Q2: E[(f(i,j)?f^(i,j))y?(k,l)]=0
% Q3: False
% Q4: the posterior distribution
% Q5: Maximum likelihood estimation maximizes the posterior distribution
%     The total variation prior promotes piecewise smooth restored images
%       X
% Maximum likelihood estimation maximizes the posterior distribution
% 
% Maximum a posteriori estimation always results in closed-form solutions
% X
% Maximum likelihood estimation maximizes the posterior distribution
% Q6: Image super-resolution
%       Defocusing
%       Pansharpening
% Q7: 4.30

%% Simulate 1-D blur and noise
image_original = im2double(imread('Cameraman256.bmp', 'bmp'));
[H, W] = size(image_original);
blur_impulse = fspecial('motion', 7, 0);
image_blurred = imfilter(image_original, blur_impulse, 'conv', 'circular');
noise_power = 1e-4;
randn('seed', 1);
noise = sqrt(noise_power) * randn(H, W);
image_noisy = image_blurred + noise;

figure; imshow(image_original, 'border', 'tight');
figure; imshow(image_blurred, 'border', 'tight');
figure; imshow(image_noisy, 'border', 'tight');

%% CLS restoration
alpha = [0.0001, 0.001, 0.01, 0.1, 1, 10, 100];  % you should try different values of alpha
figure;
for i=1:numel(alpha)
    image_cls_restored = cls_restoration(image_noisy, blur_impulse, alpha(i));
    subplot(4,2,i);imshow(image_cls_restored, 'border', 'tight');
    e1=image_original-image_noisy;
    e2=image_original-image_cls_restored;
    E1=mean2(e1.*e1);
    E2=mean2(e2.*e2);
    isnr(i)=10*log10(E1/E2);
end

%% computation of ISNR
max(isnr)