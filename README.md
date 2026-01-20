# 🔒 Network Security - Phishing Detection System

A comprehensive Machine Learning-based phishing detection system that analyzes websites using 30 different features to identify potential phishing threats. The system includes a FastAPI backend for predictions, a Streamlit frontend for interactive analysis, and MLflow integration for experiment tracking.

## 📋 Table of Contents
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Model Training](#model-training)
- [Docker Deployment](#docker-deployment)
- [Model Performance](#model-performance)
- [Contributing](#contributing)

## ✨ Features

### 🎯 Core Functionality
- **Batch Prediction**: Upload CSV files for bulk website analysis
- **Manual Input**: Analyze individual websites with custom feature values
- **Real-time Detection**: Instant phishing detection with detailed metrics
- **Interactive Dashboard**: Modern Streamlit UI with visualizations
- **RESTful API**: FastAPI backend for easy integration

### 📊 Analysis Capabilities
- 30+ website features analyzed
- Risk assessment scoring
- Classification metrics (Accuracy, Precision, Recall, F1-Score)
- Detailed feature breakdown
- Exportable results (CSV format)

### 🔧 ML Pipeline
- Automated data ingestion from MongoDB
- Data validation and transformation
- Model training with hyperparameter tuning (GridSearchCV)
- Multiple algorithms evaluation (Random Forest, Decision Tree, Gradient Boosting, etc.)
- MLflow experiment tracking and model registry
- Model versioning and deployment

## 🛠️ Tech Stack

### Backend
- **Python 3.10+**
- **FastAPI** - High-performance web framework
- **Uvicorn** - ASGI server
- **Pydantic** - Data validation

### Frontend
- **Streamlit** - Interactive web interface
- **Pandas** - Data manipulation
- **Plotly/Matplotlib** - Visualizations

### Machine Learning
- **scikit-learn** - ML algorithms and preprocessing
- **NumPy** - Numerical computing
- **Pandas** - Data processing

### MLOps
- **MLflow** - Experiment tracking and model registry
- **DagsHub** - MLflow hosting and collaboration

### Database
- **MongoDB** - NoSQL database for data storage
- **PyMongo** - MongoDB driver

### Deployment
- **Docker** - Containerization
- **Docker Compose** - Multi-container orchestration

## 📁 Project Structure

```
Network_Security/
├── app.py                      # FastAPI application
├── streamlit_app.py            # Streamlit frontend
├── main.py                     # Main training pipeline
├── Dockerfile                  # Docker configuration
├── requirements.txt            # Python dependencies
├── setup.py                    # Package setup
├── .env                        # Environment variables
│
├── networksecurity/            # Main package
│   ├── components/             # Pipeline components
│   │   ├── data_ingestion.py
│   │   ├── data_validation.py
│   │   ├── data_transformation.py
│   │   └── model_trainer.py
│   │
│   ├── entity/                 # Data classes
│   │   ├── config_entity.py
│   │   └── artifact_entity.py
│   │
│   ├── pipeline/               # Training and prediction pipelines
│   │   ├── training_pipeline.py
│   │   └── batch_prediction.py
│   │
│   ├── utils/                  # Utility functions
│   │   ├── main_utils/
│   │   └── ml_utils/
│   │
│   ├── exception/              # Custom exceptions
│   ├── logging/                # Logging configuration
│   └── constant/               # Constants and configurations
│
├── final_model/                # Trained models
│   ├── model.pkl
│   └── preprocessor.pkl
│
├── Artifacts/                  # Training artifacts
├── Network_data/               # Dataset
├── prediction_output/          # Prediction results
└── templates/                  # HTML templates

```

## 🚀 Installation

### Prerequisites
- Python 3.10 or higher
- MongoDB (local or Atlas)
- Git

### Step 1: Clone the Repository
```bash
git clone <repository-url>
cd Network_Security
```

### Step 2: Create Virtual Environment
```bash
python -m venv myenv

# Windows
myenv\Scripts\activate

# Linux/Mac
source myenv/bin/activate
```

### Step 3: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 4: Install Package in Development Mode
```bash
pip install -e .
```

## ⚙️ Configuration

### Environment Variables
Create a `.env` file in the project root:

```env
MONGODB_URL_KEY=mongodb+srv://username:password@cluster.mongodb.net/?appName=Cluster0
```

### MongoDB Setup
1. Create a MongoDB Atlas account or use local MongoDB
2. Create a database named `NetworkSecurity`
3. Create a collection named `phishingdata`
4. Update the connection string in `.env`

### MLflow Configuration
The project uses DagsHub for MLflow tracking. Update these in `model_trainer.py`:

```python
os.environ["MLFLOW_TRACKING_URI"]="https://dagshub.com/your-username/Network-Security.mlflow"
os.environ["MLFLOW_TRACKING_USERNAME"]="your-username"
os.environ["MLFLOW_TRACKING_PASSWORD"]="your-token"
```

## 📖 Usage

### 1. Start FastAPI Backend
```bash
python app.py
```
The API will be available at `http://localhost:8000`
- API Documentation: `http://localhost:8000/docs`
- Alternative docs: `http://localhost:8000/redoc`

### 2. Start Streamlit Frontend
Open a new terminal and run:
```bash
streamlit run streamlit_app.py
```
The UI will open at `http://localhost:8501`

### 3. Using the Application

#### Batch Prediction
1. Navigate to the "🔍 Predict" tab
2. Upload a CSV file with the required 30 features
3. Click "Predict" to analyze
4. View results and download the output

#### Manual Input
1. Go to the "📊 Manual Input" tab
2. Enter values for each feature (-1, 0, or 1)
3. Click "Analyze Website"
4. View detailed metrics and risk assessment

## 🌐 API Endpoints

### GET `/`
Redirects to API documentation

### GET `/train`
Triggers model training pipeline
```bash
curl -X GET "http://localhost:8000/train"
```

### POST `/predict`
Upload CSV file for batch prediction
```bash
curl -X POST "http://localhost:8000/predict" \
  -F "file=@data.csv"
```

**Required CSV format:**
```csv
having_IP_Address,URL_Length,Shortining_Service,having_At_Symbol,...
1,-1,1,1,...
```

## 🎓 Model Training

### Training Pipeline Steps
1. **Data Ingestion**: Load data from MongoDB
2. **Data Validation**: Check data quality and schema
3. **Data Transformation**: Feature engineering and preprocessing
4. **Model Training**: Train multiple models with hyperparameter tuning
5. **Model Evaluation**: Calculate metrics (Accuracy, Precision, Recall, F1)
6. **Model Registration**: Save best model to MLflow

### Run Training Locally
```bash
python main.py
```

### Models Evaluated
- Random Forest Classifier
- Decision Tree Classifier
- Gradient Boosting Classifier
- Logistic Regression
- AdaBoost Classifier

### Feature List (30 Features)
1. having_IP_Address
2. URL_Length
3. Shortining_Service
4. having_At_Symbol
5. double_slash_redirecting
6. Prefix_Suffix
7. having_Sub_Domain
8. SSLfinal_State
9. Domain_registeration_length
10. Favicon
11. port
12. HTTPS_token
13. Request_URL
14. URL_of_Anchor
15. Links_in_tags
16. SFH
17. Submitting_to_email
18. Abnormal_URL
19. Redirect
20. on_mouseover
21. RightClick
22. popUpWidnow
23. Iframe
24. age_of_domain
25. DNSRecord
26. web_traffic
27. Page_Rank
28. Google_Index
29. Links_pointing_to_page
30. Statistical_report

**Feature Values:**
- `-1`: Indicates phishing characteristics
- `0`: Suspicious/neutral
- `1`: Legitimate characteristics

## 🐳 Docker Deployment

### Prerequisites
- Install Docker Desktop and ensure it is running
- Have a Docker Hub account (optional, for pushing images)

### Build the Docker Image
```bash
docker build -t networksecurity:latest .
```

### Run with Docker
```bash
docker run -p 8000:8000 --env-file .env networksecurity:latest
```

**Or with direct environment variables:**
```bash
docker run -p 8000:8000 \
  -e MONGODB_URL_KEY="your-mongodb-uri" \
  networksecurity:latest
```

### Docker Compose (Recommended)
Create `docker-compose.yml`:
```yaml
version: '3.8'
services:
  api:
    build: .
    ports:
      - "8000:8000"
    env_file:
      - .env
    volumes:
      - ./prediction_output:/app/prediction_output
      - ./final_model:/app/final_model
```

Run with:
```bash
docker-compose up -d
```

### Push to Docker Hub
```bash
docker login
docker tag networksecurity:latest <your-username>/networksecurity:latest
docker push <your-username>/networksecurity:latest
```

## 📊 Model Performance

### Classification Metrics
- **Accuracy**: ~95.2%
- **Precision**: ~94.8%
- **Recall**: ~93.5%
- **F1-Score**: ~94.1%

*Note: Metrics may vary based on training data and hyperparameters*

### Model Interpretability
The Random Forest model provides feature importance scores, helping identify which website characteristics are most indicative of phishing attempts.

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🐛 Troubleshooting

### Common Issues

**Issue: MongoDB Connection Error**
```
Solution: Check your MONGODB_URL_KEY in .env file and ensure MongoDB is accessible
```

**Issue: Model Files Not Found**
```
Solution: Run the training pipeline first: python main.py
```

**Issue: Port Already in Use**
```
Solution: Change port in app.py or kill the process using the port
```

**Issue: Streamlit Not Connecting to API**
```
Solution: Ensure FastAPI is running on http://localhost:8000
```

## 📧 Contact

For questions or support, please open an issue on GitHub.

## 🙏 Acknowledgments

- Dataset source: UCI Machine Learning Repository
- MLflow for experiment tracking
- FastAPI and Streamlit communities

---

**Made with ❤️ for Cybersecurity**
