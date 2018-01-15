function [ locOfLam, outhis ] = getLocOfLam( bpm )
%UNTITLED Summary of this function goes here

cutBy = 150;
smoothWinLen = 256;
origSize = size(bpm,2);
smoothWin = gausswin(smoothWinLen);

cutIm = bpm(:,cutBy:origSize);
hist = sum(cutIm,1);

%figure;imshow(cutIm);
%figure;plot(hist);
%outhis = hist;

smoothedHist = conv(hist,smoothWin);

outhis = smoothedHist;

locOfLam = find(smoothedHist==max(smoothedHist(:)));
locOfLam = locOfLam + cutBy -1;
locOfLam = locOfLam*(origSize/(origSize+smoothWinLen-1));
locOfLam = round(locOfLam);
end

