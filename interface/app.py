import streamlit as st
from pyswip import Prolog

# Interface Styling
st.set_page_config(page_title="AgriGuard Expert System", layout="centered")
hide_style = """
    <style>
    #MainMenu {visibility: hidden;}
    footer {visibility: hidden;}
    header {visibility: hidden;}
    </style>
    """
st.markdown(hide_style, unsafe_allow_html=True)

# Initialize Prolog Bridge
prolog = Prolog()
prolog.consult("knowledge_base.pl")
prolog.consult("engine.pl")

st.title("🌱 AgriGuard: Expert Crop Diagnostic System")
st.write("Professional Diagnostic Interface for Rice and Maize Farmers.")

# 1. Crop Selection
crop = st.selectbox("Select your Crop:", ["maize", "rice"])

# 2. Symptom Selection based on Naming Standards
symptom_options = {
    "maize": ["leaf_holes", "ragged_leaves", "frass_in_whorl", "long_brown_lesions", 
              "yellowing_leaves", "leaf_drying", "orange_pustules", "powdery_spots", "leaf_discoloration"],
    "rice": ["diamond_shaped_spots", "gray_center_lesions", "neck_rot", "yellow_leaf_tips", 
             "leaf_edge_browning", "milky_ooze", "dead_heart", "stem_holes", "white_heads"]
}

selected_symptoms = st.multiselect(f"Select symptoms observed in {crop}:", symptom_options[crop])

if st.button("Run Diagnosis"):
    # Enforce Issue 2: Weak Diagnosis Correction
    if len(selected_symptoms) < 3:
        st.error("⚠️ No matching diagnosis found. You must select at least 3 symptoms for an accurate result.")
    else:
        # Clear previous facts and assert new ones
        prolog.retractall("symptom(_)")
        for s in selected_symptoms:
            prolog.assertz(f"symptom({s})")
        
        # Execute Forward Chaining Query
        result = list(prolog.query(f"disease({crop}, Disease)"))
        
        if result:
            # Decode bytes to string to remove b' prefix
            disease_name = result[0]['Disease']
            if isinstance(disease_name, bytes):
                disease_name = disease_name.decode('utf-8')
            
            # Fetch and decode Treatment and Reasoning
            t_res = list(prolog.query(f"treatment({disease_name}, T)"))
            r_res = list(prolog.query(f"explanation({disease_name}, R)"))
            
            st.success(f"**Diagnosis:** {disease_name.replace('_', ' ').title()}")
            
            # Display IPM Components
            st.subheader("📋 Integrated Pest Management (IPM)")
            if t_res:
                t_text = t_res[0]['T']
                if isinstance(t_text, bytes): t_text = t_text.decode('utf-8')
                st.info(t_text)
            
            # Display Reasoning 
            st.subheader("🧠 System Reasoning")
            if r_res:
                r_text = r_res[0]['R']
                if isinstance(r_text, bytes): r_text = r_text.decode('utf-8')
                st.write(r_text)
        else:
            st.warning("No matching diagnosis found for this symptom combination.")
