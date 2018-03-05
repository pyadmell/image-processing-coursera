function week3
I = imread('week3.jpg');
subplot(3,2,1);
imshow(I);

MAX_I = 1;
I2 = im2double(I);

lowPassFilter = ones(3)/9;
I2_filtered = imfilter(I2, lowPassFilter, 'replicate');
mse_1 = calculateMSE(I2,I2_filtered);
PNSR_1 = 10*log10(MAX_I^2/mse_1)  %original PNSR

I2_downsampled = downsample(downsample(I2,2)',2)';
I2_filtered_downsampled = downsample(downsample(I2_filtered,2)',2)';
subplot(3,2,3);
imshow(I2_downsampled);
title('Downsampleded Only');
subplot(3,2,4);
imshow(I2_filtered_downsampled);
title('Filtered, then downsampleded');


I2_upsampled = upsample(upsample(I2_downsampled,2)',2)';
I2_upsampled(end,:) = [];I2_upsampled(:,end) = [];
I2_filtered_upsampled = upsample(upsample(I2_filtered_downsampled,2)',2)';
I2_filtered_upsampled(end,:) = [];I2_filtered_upsampled(:,end) = [];

 interpulation_filter = [0.25,0.5,0.25;
     0.5,1,0.5;
     0.25,0.5,0.25];
 
 
I2_recovered = imfilter(I2_upsampled, interpulation_filter);
I2_filtered_recovered = imfilter(I2_filtered_upsampled, interpulation_filter);
subplot(3,2,5);
imshow(I2_recovered);
title('Unfiltered, recovered image');
subplot(3,2,6);
imshow(I2_filtered_recovered);
title('Filtered, recovered image');

mse_2 = calculateMSE(I2,I2_recovered)
PNSR_2 = PNSR(I2,I2_recovered)  %unfiltered recovered image
mse_3 = calculateMSE(I2,I2_filtered_recovered)
PNSR_3 = PNSR(I2,I2_filtered_recovered)  %filtered recovered image

PNSR_4 = 10*log10(MAX_I^2/mse_3)


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

res = res/numel(x1);

function res= PNSR(x1,x2)
MAX_I = 1;
mse =  calculateMSE(x1,x2);
res = 10*log10(MAX_I^2/mse);
