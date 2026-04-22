# DCIT313 – AgriGuard Expert System

## Group Members
- Ejeh Joy Ave [JoyAj4] – 11358724
- Glorious James Okeyere [maaddae005] – 22031299
- Addae Mabel Awuku – 22014655
- Firdaus Maltiti Musah – 22021182
- Abena Twumwaa Ankobea – 22032277
- Amposah Yaw Nana – 22181957
- Amenyo Hator – 22040317

## Project Description
AgriGuard is a Knowledge-Based Expert System developed to assist farmers in diagnosing pests and diseases affecting maize and rice crops.

The system analyzes crop symptoms entered by the user and produces a diagnosis along with Integrated Pest Management (IPM) recommendations.

The goal of the system is to support farmers who may not have immediate access to agricultural experts by providing quick and reliable crop problem identification.

## System Architecture
The system follows the standard Expert System architecture consisting of three main components:

1. **Knowledge Base (Prolog)**
   - Stores facts and rules about crop diseases and pests.
   - Contains logical IF–THEN rules used for diagnosis.

2. **Inference Interface (Python)**
   - Acts as the bridge between the user and the Prolog knowledge base.
   - Sends queries to the Prolog engine and retrieves results.

3. **Documentation**
   - Contains the knowledge engineering report explaining how the agricultural knowledge was collected, structured, and represented in the system.

## Project Structure
/knowledge_base   → Prolog rules and facts (.pl file)

/interface        → Python interface that communicates with Prolog

/docs             → Project documentation and knowledge engineering report
## Technologies Used
- SWI-Prolog
- Python
- pyswip library
- GitHub (version control)

## System Workflow
1. User enters observed crop symptoms.
2. Python interface sends the symptoms to the Prolog engine.
3. Prolog checks the knowledge base rules.
4. The inference engine determines the possible pest or disease.
5. The system outputs a diagnosis and recommended treatment.

## Project Purpose
The AgriGuard Expert System demonstrates how Artificial Intelligence and Knowledge-Based Systems can be applied in agriculture to help farmers diagnose crop diseases and pests efficiently.

It simulates the reasoning process of a plant pathology expert using logical rules.
