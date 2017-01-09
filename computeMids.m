%Soumya Siladitya Mishra 387631
%Jahidul Adnan Sakel 387590
function mids = computeMids(freqs, edges)
%This function finds the closest frequency support points from freqs
% that are equally distant in mel domain
mids = zeros(1,length(edges));%initializing mids as the same size of edges
mids(1) = 1;%Assigning 1 according to problem statement
mids(1,end) = edges(1,end); %Assigning according to problem statement
% Calculating the mids values which are most close to edges values in freqs
for i = 2 : length(edges)-1
    [value,index] = min(abs(freqs-edges(i)));
    mids(i) = freqs(index);
end
