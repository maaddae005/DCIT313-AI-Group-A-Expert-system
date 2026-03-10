% Crops
crop(maize).
crop(rice). 

% MAIZE ISSUES
% Diagnosis Rules 
disease(maize, fall_armyworm) :- symptom(leaf_holes), symptom(ragged_leaves), symptom(frass_in_whorl).
disease(maize, maize_leaf_blight) :- symptom(long_brown_lesions), symptom(yellowing_leaves), symptom(leaf_drying).
disease(maize, maize_rust) :- symptom(orange_pustules), symptom(powdery_spots), symptom(leaf_discoloration).

% Treatment Rules (IPM included) 
treatment(fall_armyworm, "Cultural: Crop rotation with soybeans/sorghum, early planting. Biological: Neem-based biopesticides or Bt formulations. Chemical: Emamectin benzoate or spinetoram (20% threshold).") :- !.
treatment(maize_leaf_blight, "Cultural: Remove infected leaves, plow under residue. Biological: Trichoderma harzianum biofungicides. Chemical: Azoxystrobin or Mancozeb every 7-14 days.") :- !.
treatment(maize_rust, "Cultural: Field sanitation, avoid overhead irrigation. Biological: Bacillus pumilus foliar spray. Chemical: Propiconazole or Sulfur fungicides.") :- !.

% RICE ISSUES

% Diagnosis Rules 
disease(rice, rice_blast) :- symptom(diamond_shaped_spots), symptom(gray_center_lesions), symptom(neck_rot).
disease(rice, bacterial_leaf_blight) :- symptom(yellow_leaf_tips), symptom(leaf_edge_browning), symptom(milky_ooze).
disease(rice, rice_stem_borer) :- symptom(dead_heart), symptom(stem_holes), symptom(white_heads).

% Treatment Rules (IPM included) 
treatment(rice_blast, "Cultural: Avoid excess nitrogen, maintain flood irrigation. Biological: Pseudomonas fluorescens seed/foliar treatment. Chemical: Tricyclazole or Azoxystrobin.") :- !.
treatment(bacterial_leaf_blight, "Cultural: Certified disease-free seeds, drain fields periodically. Biological: PGPR root treatment. Chemical: Copper-based bactericides.") :- !.
treatment(rice_stem_borer, "Cultural: Harvest at ground level, synchronize planting. Biological: Trichogramma japonicum parasitoids. Chemical: Chlorantraniliprole or cartap hydrochloride.") :- !.

% Explanations
explanation(fall_armyworm, "Larvae feed in the whorl creating ragged damage; frass in the whorl is the key diagnostic feature.").
explanation(maize_leaf_blight, "Thrives in cool, humid conditions; confirmed by cigar-shaped lesions progressing from lower leaves upward.").
explanation(maize_rust, "Spread by wind; powdery spores releasing from orange pustules are distinctive to rust.").
explanation(rice_blast, "Most destructive rice disease; confirmed by diamond-shaped spots with gray centers and neck rot.").
explanation(bacterial_leaf_blight, "Spreads in standing water; milky bacterial ooze is the key diagnostic feature distinguishing it from fungi.").
explanation(rice_stem_borer, "Larvae bore into stems; 'Dead heart' appears in vegetative stage while 'white heads' appear in reproductive stage.").
