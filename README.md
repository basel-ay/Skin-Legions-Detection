# Skin Cancer Detection

# Overview
As skin cancer is one of the most frequent cancers globally, accurate, non-invasive dermoscopy-based diagnosis becomes essential and promising. A task of Easy Company’s Deep Learning CNN model is to predict seven disease classes with skin lesion images, including melanoma (MEL), melanocytic nevus (NV), basal cell carcinoma (BCC), actinic keratosis / Bowens disease (intraepithelial carcinoma) (AKIEC), benign keratosis (solar lentigo / seborrheic keratosis / lichen planus-like keratosis) (BKL), dermatoﬁbroma (DF) and vascular lesion (VASC) as deﬁned by the International Dermatology Society.

# DATASET
This the HAM10000 ("Human against machine with 10000 training images") dataset. It consists of 10015 dermatoscopy 
images which are released as a training set for academic machine learning purposes and are publicly available through 
the ISIC archive. This benchmark dataset can be used for machine learning and for comparisons with human experts.

https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DBW86T

# TYPES OF SKIN CANCER
It has 7 different classes of skin lesion which are listed below:
1. Melanocytic Nevi (NV)
2. Melanoma (MEL)
3. Benign Keratosis-like Lesion (BKL)
4. Dermatofibroma (DF)
5. Basal Cell Carcinoma (BCC)
6. Actinic Keratoses (Akiec)
7. Vascular Lesions (Vasc)

![Original Picture](https://github.com/MohammedHameds/skin-cancer-detection/blob/main/Machine%20Learning/images/skin%20types.png?raw=true)

Melanocytic nevi, keratosis, vascular and dermatofibroma are benign lesions
Melanoma, basal cell carcinoma and actinic keratosis are malignant lesions


# SOCIETAL GOOD
Skin cancer is one of the most common cancers that has been increasing world wide. Due to diverse characteristics in benign lesions and specific lesions seen from diseases, distinguishing fatal skin cancer from other skin disorders (with the potential of cancer) is VERY IMPORTANT.
Finding out the type of cancer can take months for doctors as it is a very tedious practice and also requires the use of expensive devices and contraptions. This would waste a good lot of time for the patient which could have been utilized by the doctors to treat the patient in time. It is also monetarily very demanding on the patient’s part, which could pose a problem if the patient is not financially settled.
Our Deep learning CNN model has been trained with 10015 pre-determined skin cancer type images to accurately predict what type of cancer (or skin disease) the given patient is facing. 

# Results
Our DenseNet 21 model achieved 95% accuracy on our training and 85% accuracy on test after 20 epochs on the classification task.

![Original Picture](https://github.com/MohammedHameds/skin-cancer-detection/blob/main/Machine%20Learning/images/results.png?raw=true)

