
"""
Featurize several files at once
"""
import sys
import os
# os.environ['OPENBLAS_NUM_THREADS'] = '1'
import json
import pandas as pd
 
from atomsci.ddm.pipeline import model_pipeline as mp
from atomsci.ddm.pipeline import parameter_parser as parse
 
def featurize_from_shortlist(shortlist_path=None):
    """
    Featurize and split a list of datasets.
    """
    sl = pd.read_csv(shortlist_path)
    
    hyper_params = {
        "hyperparam": "True",
        "split_only": "True",
        "result_dir": './',
        "save_results": "False",
        "datastore": "False",
        "system": "LC",
        "id_col": "compound_id",
        "smiles_col" : "base_rdkit_smiles",
        "collection_name" : "featurize",
        'featurizer' : 'computed_descriptors',
        "num_model_tasks":1,
    }
    for feat in ['rdkit_raw', 'mordred_filtered']:
        hyper_params['descriptor_type']=feat
        for i, row in sl.iterrows():
            print(f"Featurizing {row.dataset_key} with {feat}.")
            hyper_params['dataset_key'] = row.dataset_key
            hyper_params['response_cols'] = row.response_cols
            pparams = parse.wrapper(hyper_params)

            # Create a ModelPipeline object
            pipe = mp.ModelPipeline(pparams)

            # Featurize and split the dataset
            split_uuid = pipe.split_dataset()

            # Delete split file to keep it cleaner
            print(hyper_params['result_dir'])
            os.remove(f"{hyper_params['result_dir']}/{dataset_key.replace('.csv', '_train_valid_test_scaffold_')}{split_uuid}.csv")
        
if __name__ == '__main__':
    print('shortlist file:', sys.argv[1])
    fp = sys.argv[1]
    featurize_from_shortlist(fp)
    sys.exit(0)