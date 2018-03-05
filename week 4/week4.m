% function week4

% Q1: [1,2,4]
% Q2: 2
% Q3: 1.5
% Q4: 2
% Q5: False
% Q6: white
% Q7: false


I1 = imread('frame_1.jpg');
I2 = imread('frame_2.jpg');

I1d = im2double(I1);
I2d = im2double(I2);

I2r = I2d(65:96,81:112);

subplot(3,2,1);
imshow(I1)
subplot(3,2,2);
imshow(I2)

subplot(3,2,3);
imshow(I1d)
subplot(3,2,4);
imshow(I2d)
subplot(3,2,6);
imshow(I2r)

for i=1:size(I1d,1)-size(I2r,1)
    for j = 1:size(I1d,2)-size(I2r,2)
        I1r = I1d(i:i+31,j:j+31);
            MAE(i,j) = (1/32/32)*sum(sum(abs(I1r*255-I2r*255)));
    end
end

[I,J] = find(MAE==min(min(MAE)))
Q8 = I+J
Q9 = min(min(MAE))

subplot(3,2,5);
 I1r = I1d(I:I+31,J:J+31);
imshow(I1r)
