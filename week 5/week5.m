% function week5

% Q1: true
% Q2: 3
% Q3: 1
% Q4: 1,3
% Q5: 1,4
% Q6: 2,3,4 x --> 2,4 x --> 3,4 x



I1 = imread('digital_images_week5_quizzes_noisy.jpg');
I1d = im2double(I1);

I0 = imread('digital_images_week5_quizzes_original.jpg');
I0d = im2double(I0);

subplot(2,2,1)
imshow(I1d)
subplot(2,2,3)
imshow(I0d)

I1f = medfilt2(I1d, [3 3]);
I1ff = medfilt2(I1f, [3 3]);

subplot(2,2,2)
imshow(I1f)
subplot(2,2,4)
imshow(I1ff)

% figure
% I1fff = medfilt2(I1ff, [3 3]);
% subplot(2,2,1)
% imshow(I1fff)
% for i = 1:100
% I1fff = medfilt2(I1fff, [3 3]);
% end
% subplot(2,2,2)
% imshow(I1fff)
% for i = 1:100
% I1fff = medfilt2(I1fff, [3 3]);
% end
% subplot(2,2,3)
% imshow(I1fff)
% for i = 1:100
% I1fff = medfilt2(I1fff, [3 3]);
% end
% subplot(2,2,4)
% imshow(I1fff)

Q7 = round(100*psnr(I0d, I1d))/100
Q8 = round(100*psnr(I0d, I1f))/100
Q9 = round(100*psnr(I0d, I1ff))/100
