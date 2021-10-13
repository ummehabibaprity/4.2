prompt = 'Sigma value = ';
sigma = input(prompt);

I = rgb2gray(im2double(imread('input.jpg')));
s = size(I);

paddedImage = zeros(s(1)+2,s(2)+2);


for i = 4: s(1)+1
    for j = 4:s(2)+1
        paddedImage(i,j) = I(i-1,j-1);
    end
end
%figure; imshow(I);
figure; imshow(paddedImage);

m = 3;
n = 3;
[X, Y]=meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
a = 1/(2*pi*power(sigma,2));
b1 = -(power(X,2) + power(Y,2));
b2 = 2*power(sigma,2);
b = b1/b2;
gussianfilter = a*exp(b);

filteredImage = zeros(s);
for i = 1:s(1)-2
    for j = 1:s(2) - 2
        N = paddedImage(i:i+2,j:j+2);
        N = N.*gussianfilter;
        B = reshape(N,1,[]);
        filteredImage(i,j) = sum(B);
    end
end

figure;
imshow(filteredImage);

%disp(size(I));
disp(size(paddedImage));
disp(size(filteredImage));
