function filter = computeFilter(mids,freqs)
%This function computes the triangular filters as cell
%the first and last filter values are dummy and only 24 within
%them are useful
filter = cell(length(mids),1);
filter {1,1} = [1;1;1]; %some dummy values
filter{end,1} = [1;1;1]; %some dummy values
result = zeros(1,length(freqs)); %this will hold filer values
%mel-filter bank formation based on given equation
for t = 2: length(mids)-1 %length of mids is k+2
    for i = 1: length(freqs)
         if freqs(i) < mids(t-1)
             result(i) = 0;
     
         elseif mids(t-1)<= freqs(i) && freqs(i)<mids(t)
            result(i) = 2*(freqs(i)-mids(t-1))/((mids(t+1)-mids(t-1))*(mids(t)-mids(t-1)));
            
         elseif mids(t)<=freqs(i) && freqs(i)<= mids(t+1)
            result(i) = 2*(mids(t+1)-freqs(i))/((mids(t+1)-mids(t-1))*(mids(t+1)-mids(t)));
        
         elseif freqs(i) > mids(t+1)
              result(i) = 0;
         end
    end
    filter{t,1} = result;%taking each filter in filter bank
end