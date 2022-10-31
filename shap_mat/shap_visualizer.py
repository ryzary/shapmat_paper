import shap

def summary_plot(X, shap_values,max_display=10,savefig=False):
    shap.summary_plot(shap_values, X, show=False, max_display=max_display)
    plt.title('Local Explanation Summary',fontsize=20)

def waterfall_plot(explainer,shap_df,subject_id,max_display=10):
    shap.plots._waterfall.waterfall_legacy(explainer.expected_value[1], shap_df.loc[subject_id],
     show=False, features=shap_df.loc[subject_id], max_display=max_display)


