% Adjust the contrast of the input image for segmentation

function imOUT = AdjustContrast(imIN)

minIM = min(imIN(:));
maxIM = max(imIN(:));
imOUT  = (imIN - minIM) / (maxIM-minIM);
