function edges = melfreqs(fmin, fmax, k)
% mesfreqs computes K+2 equally spaced points in the mel frequency
% scale
% The fmin and fmax is converted to mel frequency by the formula Mel(f)=2595 ∙log10( 1+ f/700 ) .
% Then a vector of equally spaced values is calculated in the mel-frequency domain ranging from the mel-fmin to the mel-fmax.
% The equally spaced values are transformed back to the linear frequency domain.

% mel frequency of fmin
mFmin = 2595*log10(1+(fmin/700));
% mel frequence of fmax
mFmax = 2595*log10(1+(fmax/700));

% equally spaced values in mel frequency scale
mEdges =linspace(fmin, fmax, k+2);

% transformation of mel frequency to linear frequency by the inverse mel
% function
edges = (power(10, (mEdges./2595))-1)*700;
end

