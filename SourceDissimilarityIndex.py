# -*- coding: utf-8 -*-
"""
Use as: SDI = SourceDissimilarityIndex(data1, data2)

@author: emmah
Created on Sat Jul 29 09:44:51 2017
"""

import numpy as np

# This function calculates the deviation of each element from the mean,
# relative to the average deviation across the dataset.
def normalise(data):    
    
    # This metric doesn't care how the data are arranged, so we reshape to a
    # vector
    print('Reshaping data...')
    
    data_norm	 = data.reshape(1, np.size(data), order='F').copy()
    print('...done')
    
    # Subtract the mean from each element
    print('Normalising...')
    data_norm = data_norm - np.mean(data_norm)
    
    # Divide by the root mean square deviation from the mean across elements
    if (np.mean(data_norm**2) != 0):
        data_norm	= data_norm / np.math.sqrt(np.mean(data_norm**2))
    print('...done')
    
    return data_norm


# This function calculates an index of dissimilarity between data1 and data2.
def SourceDissimilarityIndex(data1, data2):
    
    # Convert data to numpy array
    data1 = np.array(data1)
    data2 = np.array(data2)
    
    # Check input variables to ensure dimensions match
    if not (np.shape(data1) == np.shape(data2)):
        raise ValueError('data1 and data2 must have the same dimensions')
    
    # Calculate the deviation of each element in each dataset from the mean,
    # relative to the average deviation across the dataset
    print('DATA 1:')
    data1_norm	= normalise(data1)
    print('DATA 2:')
    data2_norm	= normalise(data2)
    
    # Take the root mean square (rms) difference between the two conditions
    print('Calculating dissimilarity index...')    
    SDI = np.math.sqrt(np.mean((data1_norm - data2_norm)**2))
    print('...done')
    
    # Print the value
    print('----------------------------------');
    print('Source Dissimilarity Index = ' + str("{0:.3f}".format(SDI)));
        
    return SDI