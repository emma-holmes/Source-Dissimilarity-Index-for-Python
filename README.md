# Source-Dissimilarity-Index
My statistical method for comparing 'dissimilarity' between two datasets.
If you find the method or code useful, please get in touch. I would be interested to hear how people are applying it.

## About the method
### Some background:
I originally devised this method to index the dissimilarity in brain activity between two experimental conditions. The difference in activity is compared between two conditions at each voxel in the brain, normalised by the total activity (across the entire brain) in each condition. The Source Dissimilarity Index is then computed as the average difference across voxels. The computed value lies between 0 and 2. A value of 0 indicates that the relative distribution of activity across voxels is the same in the two conditions, whereas a value of 2 indicates that there is no overlap between the conditions.
  
I found this method to be useful when analysing source-reconstructed electro-encephalography (EEG) data. I found that different source reconstruction methods (e.g., IID model, S-LORETA) produced different patterns of activity across the brain. Given that the reconstruction is underdetermined and is based on the topographic data, I predicted that, no matter which method was used to reconstruct activity, there would be a commonality in the reconstructions related to the degree of source overlap between two experimental conditions. The dissimilarity index was intended to index how dissimilar the sources were between the two conditions, regardeless of the particular sources that were active. The Source Dissimilarity Index provides a single value to index the difference.
  
The consistency of the difference across different instances can be indexed by permuting the labels and computing the Source Dissimilarity Index for each permutation. Following a large number of permutations (e.g., 10,000), a good approximation to the null is achieved. The value of the Source Dissimilarity Index from the original data can then be compared to the null to determine whether the dissimilarity is significantly larger/smaller than expected by chance.
  
This Source Dissimilarity method was inspired by Global Dissimilarity, which has been used to analyse the topography of scalp EEG. This method is described in: 
>Lehmann D, Skrandies W. Reference-free identification of components of checkerboard-evoked multichannel potential fields. Electroenceph Clin Neurophysiol. 1980;48:609–21.
  
The method is also referred to as the Global Map Dissimilarity, as described here: 
>Brunet, D., Murray, M. M., & Michel, C. M. (2011). Spatiotemporal analysis of multichannel EEG: CARTOOL. Computational intelligence and neuroscience.

### Extentions of the method:
  Although the method was originally intended to compare the sources of brain data, the same method has many other potential applications. It can be used to compare two datasets of any sizes and dimensionalities--for example, between two conditions, between two moments in time, or between two different pieces of equipment. The only requirement is that the two datasets are the same size. The method will assess differences in configuration across the dimensions of the input data (in the example above, this was space, but the dimensions could be time or any other relevant dimension). I hope that this method is useful and I am interested to find out how people decide to apply it.

## Getting started
### Prerequisites
There are two versions of this code: one for MATLAB and one for Python 3.

The MATLAB code was written using MATLAB 2014b, although uses basic MATLAB functions that are compatible with older and newer versions of MATLAB. No additional toolboxes are required.

The Python 3 code was written using Python 3.6.1. The numpy toolbox is required to run the script.

### Running the MATLAB script
The MATLAB code is contained within the following file: SourceDissimilarityIndex.m

The script takes two inputs: data1 and data2. The two inputs must have the same dimensions.

The code can be run as follows:
```
SDI = SourceDissimilarityIndex(data1, data2)
```
The output from the script is a value between 0 and 2.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
