function SDI = SourceDissimilarityIndex(data1, data2)
% SDI = SourceDissimilarityIndex(data1, data2)
%
%   Inputs:
%       data1           Matrix containing the first dataset.
%       data2           Matrix containing the second dataset (must be 
%                       the same size as data1).
%   Outputs:
%       SDI             Source Dissimilarity Index value.
%
%
% This script calculates an index of dissimilarity between data1 and data2.
%
% -------------------------------------------------------------------------
% Emma Holmes
% Created on 29th July 2017

    
% Check input variables to ensure dimensions match
if ~all(size(data1) == size(data2))
    error('Error: The dimensions of data1 and data2 are different');
end

% Calculate the deviation of each element in each dataset from the mean,
% relative to the average deviation across the dataset
fprintf('\n\nDATA 1:')
data1_norm	= normalise(data1);
fprintf('\n\nDATA 2:')
data2_norm	= normalise(data2);

% Take the root mean square (rms) difference between the two conditions
fprintf('\n\nCalculating dissimilarity index...')
SDI = sqrt(mean((data1_norm - data2_norm).^2));
fprintf('\n...done')

% Print out the value
fprintf('\n\n----------------------------------');
fprintf('\nSource Dissimilarity Index = %.3f\n', SDI);

end


% -------------
% SUB-FUNCTIONS
% -------------

function data_norm = normalise(data)
% data_norm = normalise(data)
%
% This function calculates the deviation of each element from the mean,
% relative to the average deviation across the dataset.


% This metric doesn't care how the data are arranged, so we reshape to a
% vector
fprintf('\n\nReshaping data...')
data_norm	= reshape(data, [1, numel(data)]);
fprintf('\n...done')

% Subtract the mean from each element
fprintf('\n\nNormalising...')
data_norm	= data_norm - mean(data_norm);

% Divide by the root mean square deviation from the mean across elements
if ~ mean(data_norm.^2) == 0
    data_norm	= data_norm ./ sqrt(mean(data_norm.^2));
end
fprintf('\n...done')

end