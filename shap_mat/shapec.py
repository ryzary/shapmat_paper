import pandas as pd
import numpy as np
from sklearn.model_selection import RepeatedStratifiedKFold
from sklearn.ensemble import RandomForestClassifier
from sklearn.neural_network import MLPClassifier
from sklearn.linear_model import LogisticRegression
from sklearn import linear_model
from sklearn.svm import SVC
from xgboost import XGBClassifier
import shap
from sklearn.metrics import roc_auc_score
from sklearn import decomposition
from sklearn.model_selection import LeaveOneOut
import lightgbm as lgb
from utils.utils import *
from tqdm.notebook import tqdm


def shapec_cv(X,y,n_splits,n_repeats,clf_1,clf_2,n_pc):
    """
    Returns CV result of SHAPEC (SHAP Embedding-based Classifier) 

    Args:
        X (pandas Dataframe): relative abundance data
        y (pandas Dataframe): phenotype label
        n_splits (int): number of splits for cross-validation
        n_repeats (int): number of repeats for cross-validation
        clf_1 (scikit-learn classifier): first classifier (to generate SHAP values)
        clf_2 (scikit-learn classifier): second classifier (to make final prediction)
        n_pc (int): _description_

    Returns:
        int: mean AUC 
    """
    splitter = RepeatedStratifiedKFold(n_splits=n_splits, n_repeats=n_repeats, random_state=0)

    aucs = []
    iteration = 1
    for train_index, test_index in splitter.split(X, y):
        
        train_subject_ids = X.iloc[train_index].index
        test_subject_ids = X.iloc[test_index].index
        
        X_train = X.loc[train_subject_ids]
        X_test = X.loc[test_subject_ids]
        
        y_train = y.loc[train_subject_ids]
        y_test = y.loc[test_subject_ids]

        train_df = X_train.join(y_train)
        test_df = X_test.join(y_test)

        ### TRAINING
        # 1. Train Classifier 1
        clf_1.fit(X_train.values,y_train)

        # 2. SHAP of train data
        explainer_1 = shap.TreeExplainer(clf_1, data=X_train)
        shap_train = explainer_1.shap_values(X_train)

        if len(shap_train) == 2: # for RF model
            shap_train = shap_train[1] # choose class 1 (CRC)
        
        shap_train = pd.DataFrame(shap_train,columns=X_train.columns,index=X_train.index)
        
        # filter only correct prediction
        y_pred = clf_1.predict(X_train.values)

        is_prediction_correct = []
        for pred, label in zip(y_pred, y_train):
            if pred == label:
                is_prediction_correct.append(True)
            else:
                is_prediction_correct.append(False)
        
        shap_train['correct_pred'] = is_prediction_correct

        shap_train = shap_train[shap_train['correct_pred']==True]
        shap_train = shap_train.drop('correct_pred',axis=1)
                
        # 3. Get PCs
        pca = decomposition.PCA(n_components=n_pc)
        pca.fit(shap_train.values)
        
        pc_train=pca.transform(shap_train.values)

        # 4. Train Classifier 2 on PCs
        clf_2.fit(pc_train,y_train)

        predict_proba_train = clf_2.predict_proba(pc_train)[:,1] # predict CRC proba
        train_auc = roc_auc_score(y_train, predict_proba_train)

        ### TEST
        # 1. SHAP of test data
        shap_test = explainer_1.shap_values(X_test)
        if len(shap_test) == 2: # for RF model
            shap_test = shap_test[1] # choose class 1 (CRC)

        # 2. Get PCs 
        pc_test=pca.transform(shap_test)

        # 3. Predict 
        predict_proba_test = clf_2.predict_proba(pc_test)[:,1] # predict CRC proba
        test_auc = roc_auc_score(y_test, predict_proba_test)
        aucs.append(test_auc)

        # print(f'ITERATION {iteration} | Train-{iteration} AUC: {train_auc} | Test-{iteration} AUC: {test_auc} ')
        iteration +=1

    mean_test_auc = np.mean(aucs)
    # print('Mean Test AUC: ', mean_test_auc )
    return mean_test_auc

    # original model
    # clf_ori = RandomForestClassifier(random_state=0)
    # clf_ori = XGBClassifier(use_label_encoder=False,eval_metric='auc',random_state=0)
    # clf_ori = lgb.LGBMClassifier(random_state=0)
    # clf_ori=MLPClassifier(random_state=0,max_iter=3000,solver='sgd')
    # clf_ori = LogisticRegression(random_state=0, max_iter=3000)

    # ori_auc = cv(X,y,model=clf_ori)
    # print('Original AUC: ', np.mean(ori_auc))