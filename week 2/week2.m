function week2
I = imread('digital-images-week2_quizzes-lena.gif');
imshow(I);

MAX_I = 255;
I2 = im2double(I);

filter_1 = ones(3)/9;
I2_filtered_1 = imfilter(I2, filter_1, 'replicate');
% mse_1 = mse(I2,I2_filtered_1);
% PNSR_1 = 10*log10(MAX_I^2/mse_1)
PNSR_1 = psnr(I2, I2_filtered_1)

filter_2 = ones(5)/25;
I2_filtered_2 = imfilter(I2, filter_2, 'replicate');
% mse_2 = mse(I2,I2_filtered_2);
% PNSR_2 = 10*log10(MAX_I^2/mse_2)
PNSR_2 = psnr(I2, I2_filtered_2)


function res = calculateMSE(x1,x2)

res = 0;

if any(size(x1)~= size(x2))
    return;
end

for i=1:size(x1,1)
    for j=1:size(x1,2)
        res = res + (x1(i,j)-x2(i,j))^2;
    end
end

function res= PNSR(x1,x2)
MAX_I = 1;
mse =  calculateMSE(x1,x2);
res = 10*log10(MAX_I^2/mse);
