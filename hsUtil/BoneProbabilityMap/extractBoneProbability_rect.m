%-------------------------------------------------------------------------%
%                     Bone Segmentation in US images                      %
%     Author: Pezhman Foroughi, Johns Hopkins University, Feb. 2007       %
%     modified by: Abtin Rasoulian, University of British Columbia        %
%-------------------------------------------------------------------------%
%
% [Bness imBLOG] = extractBoneProbability(USimage, USdepth, isHuman,
% normalize)
%
% estimate the probability of pixel in the ultrasound image to be bone
% surface. If the image is from in vivo data isHuman should be set to 1.
% Normalize equal to 1, window the result between 0 and 1.

%%
function [Wshw, Bness] = extractBoneProbability_rect(USimage, smoothingSigma,...
    shadowSigma, blurredVsBLOG, shodowVsIntensity,shadow_method, alpha, beta, gamma)

[imH, imW] = size(USimage);

boneTh = 1/8;   % Foroughi uses boneTh = 1/8

im = im2double(USimage);

hsize = floor(smoothingSigma*3)*2+1;
h = fspecial('gaussian', hsize, smoothingSigma);

DownSampleFactor = 1;
imBlured = imfilter(im, h, 'replicate', 'same');
imBlured = imBlured(1:DownSampleFactor:imH,1:DownSampleFactor:imW);
imBlured = AdjustContrast(imBlured);

h = [0 -1 0; -1 4 -1; 0 -1 0];
imBLOG = imfilter(imBlured, h, 'replicate', 'same');
imBLOG = (imBLOG>0).*imBLOG;
imBLOG = imBLOG/0.005;

imBLOG = (imBLOG>0.2).*imBLOG;

% To make the algorithm faster, keep track of the points that are probable
% to be the bone surface
% First: Apply the threshold to the image (this is a loose threshold)
imMask = (imBlured >= boneTh);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% SHADOW %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (strcmp (shadow_method, 'foroughi')) % foroughi's method
    Wshw = CalcBoneShadow(imMask, imBlured, shadowSigma);
elseif (strcmp (shadow_method, 'rw'))
    % Call confidence estimation for B-mode with default parameters
    Wshw =1-confMap(USimage, alpha, beta, gamma);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% calculate the intensity weight
Wint = imMask .* (imBlured.^blurredVsBLOG+imBLOG); %imBlured power added by abtin (was 1.5 in stable version)

Wint = AdjustContrast(Wint);

% calculate the total Boniness, (Multipication prefered over addition)
Bness = Wshw.^shodowVsIntensity.*Wint;
%% COMMENTED BY DEL BECAUSE RECTANGULAR
% removingMask = [ones(30, 1); zeros(30,1)];
% removingMask2D = conv2(double(Mask2DImage), double(removingMask), 'same')>(shadowSigma*8);
% Bness = Bness.*removingMask2D;
%%
% normalize
Bness = Bness/max(Bness(:));


