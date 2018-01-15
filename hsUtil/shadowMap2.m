function [ S ] = shadowMap2( I )

[rows,cols] = size(I);
S = zeros(size(I));
A = 0;
B = 0;

for a=1:rows
    
    for b=1:cols
        
        for k=b:rows
           % dosn't work cause matrix dimentions dont agree because of
           % gausswin
          %  A = gausswin(k-b)*I(a,k) + A;
          %  B = gausswin(k-b) + B;
          
          %this make the image look red but the same image.
          %at the end you have to convert back to uint8 but at the
          %begining it doesnt matter. 
          %A = gaussmf(k-b, [1 0])*I(a,k) + A;
          %B = gaussmf(k-b, [1 0]) + B;
           A = gaussmf(k-b, [3 0])*I(a,k) + A;
           B = gaussmf(k-b, [3 0]) + B;
        end
        
        S(a,b) = A/B;
        A = 0;
        B = 0;
        
    end
    
end

end

