I = imread('images/dental.png');
if (ndims(I) == 3)
    I = rgb2gray(I);
end
size(I)
I(331:352,:) = 0.34*225;
imshow(I)