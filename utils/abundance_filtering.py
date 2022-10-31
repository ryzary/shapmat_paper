def set_abundance_to_zero(data,abundance_threshold=1e-5):
    """
    Set abundance that are < threshold to 0
    """
    low_abundance = [] 
    for species in data.columns:
        for i,v in enumerate(data[species]):
            if v != 0 and v < abundance_threshold:
                low_abundance.append([species,i,v])

    # print(f'Thresh: {abundance_threshold}; Converting {len(low_abundance)} low abundance data to zeros')
    filter_low_ab = data.copy()
    filter_low_ab[data<abundance_threshold] = 0.0
    return filter_low_ab

def prevalence_filter(data,rel_ab_threshold=1e-5,percent_threshold=0.9):
    data = set_abundance_to_zero(data)
    species_list = data.columns

    selected_species = []
    for species in species_list:
        species_ab = list(data[species])
        n_zero = species_ab.count(0) 
        percent_zeros = n_zero/len(species_ab)
        
        if percent_zeros < percent_threshold:
            selected_species.append(species)

    filtered_data = data[selected_species]

    # print(f'{len(selected_species)} species remains after filtering. Initially, there were {len(data.columns)} species.')
    return filtered_data