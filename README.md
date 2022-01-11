# Nonspecificity-strife-and-total-uncertainty-in-supervised-feature-selection
Matlab Code files strife, nonspecificity and total uncertainty for supervised feature selection in the context of classification. Includes also three articial examples. 

If you use the codes, please be so kind to cite the related open-access (=free) journal article:

Lohrmann, C, Luukka, P., 2022. Nonspecificity, strife and total uncertainty in supervised feature selection, Engineering Applications of Artificial Intelligence 109(94), doi: https://doi.org/10.1016/j.engappai.2021.104628

A short description of the files contained:


- "Artificial_Examples_and_Feature_Selection"
Contains the three artificial examples from the paper manuscript "Nonspecificity, strife and total uncertainty in supervised feature selection" and shows the function call for the functions "FSstrifePoss", "FSnonspecificityPoss", and "FStotaluncertaintyPoss"

- "FSstrifePoss", "FSnonspecificityPoss", "FStotaluncertaintyPoss"
Functions that conduct the feature ranking (filter method) for supervised feature selection. The output are the feature ranking and the scores that represent the feature relevance of each feature. These are the functions deployed by someone in order to conduct feature selection on his/her classification data set.

- "strifePoss", "nonspecificityPoss", "totalUncertaintyPoss"
Subfunctions called within the functions "FSstrifePoss", "FSnonspecificityPoss", "FStotaluncertaintyPoss" that include the calculation of uncertainty using similarity values. These functions are called within the before-mentioned functions and do not need to be directly deployed by the user.

- "maxminscal"
Function to scale the data into the unit interval [0,1]. This scaling is needed for the calculation of the similarity values within the functions "FSstrifePoss", "FSnonspecificityPoss", "FStotaluncertaintyPoss". A user should apply this function to scale all columns into the unit interval [0,1]. An example is contained in the code file "Artificial_Examples_and_Feature_Selection".

- "simi"
Function to calculate similarity using the generalized Lukasiewicz structure. This function does not need to be called directly by a user.

- "init_data_new"
A subfunction called within the functions "FSstrifePoss", "FSnonspecificityPoss", "FStotaluncertaintyPoss" to pre-process and order the data. This function does not need to be called directly by a user.
