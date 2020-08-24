# Nonspecificity-strife-and-total-uncertainty-in-supervised-feature-selection
Matlab Code files strife, nonspecificity and total uncertainty for supervised feature selection in the context of classification. Includes also three articial examples. Files are related to the manuscript "Nonspecificity, strife and total uncertainty in supervised feature selection" from Christoph Lohrmann, PhD, and Pasi Luukka, DSc.

1) Artificial_Examples_and_Feature_Selection
Contains the three artificial examples from the paper manuscript "Nonspecificity, strife and total uncertainty in supervised feature selection" and shows the function call for the functions "FSstrifePoss", "FSnonspecificityPoss", and "FStotaluncertaintyPoss"

2), 3), 4) "FSstrifePoss", "FSnonspecificityPoss", "FStotaluncertaintyPoss"
Functions that conduct the feature ranking (filter method) for supervised feature selection. The output are the feature ranking and the scores that represent the feature relevance of each feature. These are the functions deployed by someone in order to conduct feature selection on his/her classification data set.

5), 6), 7) "strifePoss", "nonspecificityPoss", "totalUncertaintyPoss"
Subfunctions called within the functions 2), 3) or 4) that include the calculation of ucnertainty using similarity values. These functions are called within the functions 2) to 4) and do not need to be deployed by the user.

8) "maxminscal"
Function to scale the data into the unit interval [0,1]. This scaling is needed for the calculation of the similarity values within the functions 2) to 4). A user should apply this function to scale all columns into the unit interval [0,1]. An example is contained in the code file 1).

9) "simi"
Function to calculate similarity using the generalized Lukasiewicz structure. This function does not need to be called directly by a user.

10) "init_data_new"
A subfunction called within the functions 2) to 4) to pre-process and order the data. This function does not need to be called directly by a user.
