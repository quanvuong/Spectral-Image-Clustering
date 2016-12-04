
clear all;
R = 7;   % neighborhood connectivity
G1 = 5;  % number of groups for standard gcut
G2 = [2:10];   % number of groups to test with rotation clustering

%IM2 = imread('FireHoze16.jpg');
%figure(3), imshow(IM2)

% IM = double(rgb2gray(imread('FireHoze16.jpg')));

load my_image_1
IM = mat2gray(X);
figure(2), imshow(IM)

[mask]     = segment_image(IM,R,G1,'SS','KM',0.1);
[mask_LS1] = segment_image(IM,R,G2,'LS','RT1');
[mask_LS2] = segment_image(IM,R,G2,'LS','RT2');
% 
Iseg     = display_clust_image_2(uint8(IM),mask,0);
Iseg_LS1 = display_clust_image_2(uint8(IM),mask_LS1,0);
Iseg_LS2 = display_clust_image_2(uint8(IM),mask_LS2,0);
% 
figure(1); clf;
subplot(1,3,1); imshow(Iseg);  title('gcut');
subplot(1,3,2); imshow(Iseg_LS1);  title('rotation clustering result');
subplot(1,3,3); imshow(Iseg_LS2);  title('result with approx descent');
