import pandas as pd
import numpy as np
from sklearn.model_selection import RepeatedStratifiedKFold, StratifiedKFold
from sklearn.model_selection import cross_val_score


def cv(X,y,model,n_splits=10,n_repeats=10,random_state=0,scoring='roc_auc'):
    # for binary
    rkf = RepeatedStratifiedKFold(n_splits=n_splits, n_repeats=n_repeats,random_state=random_state) 
    cv_score_auc = cross_val_score(model, X, y, cv = rkf,scoring=scoring)
    cv_df = pd.DataFrame([cv_score_auc],columns=np.arange(1,n_repeats*n_splits+1),index=['AUC-ROC'])
    cv_df['Mean'] = [cv_score_auc.mean()]
    # print('Mean AUC: ',cv_df['Mean'].values[0])
    return cv_df['Mean'].values[0]

def species_name_to_plt_title(species_name):
    if species_name.split('_')[1]=='sp' or species_name.split('_')[1]=='faecis':
        return species_name.replace('_',' ')
        
    elif len(species_name) > 25: 
        names = species_name.split('_')
        last_names = ' '.join(names[1:])
        combined = names[0]+'_'+last_names
        return combined.replace('_','\n')
    
    else:
        return species_name.replace('_','\n')