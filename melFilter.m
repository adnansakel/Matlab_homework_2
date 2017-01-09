%Soumya Siladitya Mishra 387631
%Jahidul Adnan Sakel 387590
function melSpec = melFilter(spec, filter)
%melFilter uses the triangular filter 'filter' from exercise E3 and 
% the linear spectrum of the signal spec to compute speech features in the 
% mel-scaled spectral domain.
%   a matrix multiplication of filter*spec is done

% filter is a cell of 24 rows each with 1X257 values
% the filter is converted to a matrix of 24X257
matFilter = cell2mat(filter);
% matrix multiplication between matFilter(24X257) and absolute value of spec(257X283) is done
melSpec = matFilter*abs(spec);

end

