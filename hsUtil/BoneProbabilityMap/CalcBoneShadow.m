%-------------------------------------------------------------------------%
%              Calculate the bone shadowness in US images                 %
%     Author: Pezhman Foroughi, Johns Hopkins University, Feb. 2007       %
%                           pezhman@cs.jhu.edu                            %
%-------------------------------------------------------------------------%

function BSh = CalcBoneShadow(imMask, im, Gsigma)

[imH, imW] = size(im);

BSh = zeros(imH, imW);

% Create the shadow model estimated by a gaussian
tt = 1 : imH-5;
ShadowM = exp(-(tt-1).^2/(2*Gsigma*Gsigma));
ShadowM = 1 - ShadowM';

ShadowM = [zeros(5,1); ShadowM];

% find non-zero indices
% imMask(imH,:) = 0; % make sure you don't get single elements in for loop
[indi, indj] = find(imMask>0);

ShadowNess = zeros(size(indi));

%% Faster version
ShadowMSum = flipud(cumsum(ShadowM));
ShadowM = [zeros(length(ShadowM), 1); ShadowM];
ShadowNess = imfilter(im, ShadowM,'corr', 'same', 'replicate');
ShadowNess = bsxfun(@rdivide, ShadowNess, ShadowMSum+0.00000001);
mSh = min(ShadowNess(:));
MSh = max(ShadowNess(:));
BSh = 1 - ((ShadowNess - mSh) / (MSh - mSh));
BSh = BSh.*imMask;


% for k = 1 : size(indi,1)
% 
%     ul = im(indi(k):imH,indj(k));   % the line under the pixel
%     ulsize = size(ul,1);
% 
%     SM = ShadowM(1:ulsize);
%     SM = SM / sum(SM(:));
%     
%     ShadowNess(k) = sum( SM.*ul );% / ulsize;
%     
% end
% mSh = min(ShadowNess);
% MSh = max(ShadowNess);
% for k = 1 : size(indi,1)
%     BSh( indi(k),indj(k) ) = 1 - ((ShadowNess(k) - mSh) / (MSh - mSh));%power added by Abtin
% end

