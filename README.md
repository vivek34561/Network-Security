# 🔒 Network Security – Phishing Detection System

<p align="center">
  <img src="https://img.shields.io/badge/python-3.10+-blue.svg" alt="Python"/>
  <img src="https://img.shields.io/badge/FastAPI-latest-green.svg" alt="FastAPI"/>
  <img src="https://img.shields.io/badge/MLflow-enabled-orange.svg" alt="MLflow"/>
  <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License"/>
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs Welcome"/>
</p>

<p align="center">
  <strong>A production-grade machine learning system for detecting phishing websites using 30 security features.</strong>
</p>

<p align="center">
  <a href="#-features">✨ Features</a> •
  <a href="#-architecture">🏗️ Architecture</a> •
  <a href="#-quick-start">🚀 Quick Start</a> •
  <a href="#-how-it-works">🔬 How It Works</a> •
  <a href="#-examples">📚 Examples</a>
</p>

---

## 🎯 Overview

Network Security is a comprehensive ML-based phishing detection system that analyzes websites using 30 engineered features to identify potential phishing threats.

It includes:

* A FastAPI backend for real-time and batch predictions
* A Streamlit frontend for interactive analysis
* A full ML pipeline for training, validation, and evaluation
* MLflow integration for experiment tracking and model registry
* Dockerized deployment for production use

**From this:**

```
Upload a CSV with website features
```

**To this:**

```
Prediction Results
------------------
Website 1 → Legitimate
Website 2 → Phishing
Website 3 → Suspicious

Accuracy: 95.2%
```

⏱️ Prediction time: milliseconds per sample
✅ Status: Production-ready ML system

---

## 💡 Why I Built This

**The Problem**
Phishing websites continue to grow rapidly, and manual inspection is slow, inconsistent, and error-prone.

**Goal**
Build an end-to-end machine learning system that can:

* Automatically detect phishing websites
* Support real-time and batch predictions
* Track experiments and models professionally
* Be deployed easily using Docker

**What I Learned**

* Designing modular ML pipelines improves maintainability
* MLflow simplifies experiment tracking and versioning
* FastAPI is ideal for low-latency ML APIs
* Streamlit accelerates building data apps
* Docker makes ML systems reproducible and portable

---

## ✨ Key Features

### 🎯 Core Functionality

* Batch prediction using CSV uploads
* Manual feature input for single-website analysis
* Real-time phishing detection
* RESTful FastAPI backend
* Interactive Streamlit dashboard

### 📊 Analysis Capabilities

* 30 website features analyzed
* Risk assessment scoring
* Accuracy, Precision, Recall, F1-Score
* Feature-wise breakdown
* Exportable CSV results

### 🔧 ML Pipeline

* Automated data ingestion from MongoDB
* Data validation and transformation
* Hyperparameter tuning using GridSearchCV
* Multiple models evaluated
* MLflow experiment tracking
* Model versioning and registry

---

## 🏗️ Architecture

### High-Level Flow

```
User Input / CSV
        │
        ▼
 Streamlit UI
        │
        ▼
 FastAPI Backend
        │
        ▼
 Preprocessing
        │
        ▼
 Trained ML Model
        │
        ▼
 Predictions + Metrics
```

### Project Structure

```
Network_Security/
├── app.py                      # FastAPI backend
├── streamlit_app.py            # Streamlit frontend
├── main.py                     # Training pipeline
├── Dockerfile                  # Docker configuration
├── requirements.txt            # Dependencies
├── setup.py                    # Package setup
├── .env                        # Environment variables
│
├── networksecurity/
│   ├── components/
│   │   ├── data_ingestion.py
│   │   ├── data_validation.py
│   │   ├── data_transformation.py
│   │   └── model_trainer.py
│   │
│   ├── entity/
│   │   ├── config_entity.py
│   │   └── artifact_entity.py
│   │
│   ├── pipeline/
│   │   ├── training_pipeline.py
│   │   └── batch_prediction.py
│   │
│   ├── utils/
│   ├── exception/
│   ├── logging/
│   └── constant/
│
├── final_model/
├── Artifacts/
├── Network_data/
├── prediction_output/
└── templates/
```

---

## 🛠️ Tech Stack

| Component     | Technology                  |
| ------------- | --------------------------- |
| Backend       | FastAPI, Uvicorn            |
| Frontend      | Streamlit                   |
| ML            | scikit-learn, NumPy, Pandas |
| MLOps         | MLflow, DagsHub             |
| Database      | MongoDB, PyMongo            |
| Visualization | Plotly, Matplotlib          |
| Deployment    | Docker, Docker Compose      |

---

## 🚀 Quick Start

### Prerequisites

* Python 3.10+
* MongoDB (local or Atlas)
* Git

### Installation

```bash
git clone <repository-url>
cd Network_Security

python -m venv myenv
source myenv/bin/activate  # Linux/Mac
myenv\Scripts\activate     # Windows

pip install -r requirements.txt
pip install -e .
```

### Configuration

Create a .env file:

```env
MONGODB_URL_KEY=mongodb+srv://username:password@cluster.mongodb.net/?appName=Cluster0
```

MLflow settings (in model_trainer.py):

```python
os.environ["MLFLOW_TRACKING_URI"] = "https://dagshub.com/your-username/Network-Security.mlflow"
os.environ["MLFLOW_TRACKING_USERNAME"] = "your-username"
os.environ["MLFLOW_TRACKING_PASSWORD"] = "your-token"
```

---

## 🔬 How It Works

### Phase 1: Data Ingestion

* Load phishing dataset from MongoDB
* Store raw data in artifacts

### Phase 2: Data Validation

* Check schema
* Handle missing values
* Validate feature ranges

### Phase 3: Data Transformation

* Feature preprocessing
* Train-test split
* Scaling and encoding

### Phase 4: Model Training

* Train multiple models
* Perform GridSearchCV
* Select best model
* Log metrics to MLflow

### Phase 5: Prediction

* Load trained model
* Apply preprocessing
* Generate predictions
* Return risk score

---

## 📚 Example Usage

### Start Backend

```bash
python app.py
```

Docs:
[http://localhost:8000/docs](http://localhost:8000/docs)

### Start Frontend

```bash
streamlit run streamlit_app.py
```

UI:
[http://localhost:8501](http://localhost:8501)

---

## 🌐 API Endpoints

### GET /

Redirects to docs

### GET /train

Triggers model training

```bash
curl -X GET http://localhost:8000/train
```

### POST /predict

Batch prediction

```bash
curl -X POST http://localhost:8000/predict \
  -F "file=@data.csv"
```

---

## 🎓 Model Training

### Models Evaluated

* Random Forest
* Decision Tree
* Gradient Boosting
* Logistic Regression
* AdaBoost

### Feature Values

* -1 → phishing
* 0 → suspicious
* 1 → legitimate

---

## 🐳 Docker Deployment

```bash
docker build -t networksecurity:latest .
docker run -p 8000:8000 --env-file .env networksecurity:latest
```

Docker Compose:

```yaml
version: '3.8'
services:
  api:
    build: .
    ports:
      - "8000:8000"
    env_file:
      - .env
```

---

## 📊 Model Performance

* Accuracy: ~95.2%
* Precision: ~94.8%
* Recall: ~93.5%
* F1-Score: ~94.1%

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push and open PR

---

## 📄 License

MIT License © 2025 Vivek Kumar Gupta

---

## 👨‍💻 Author

Vivek Kumar Gupta
AI Engineering Student | MLOps & ML Systems

GitHub: @vivek34561
LinkedIn: vivek-gupta-0400452b6

---

## 🙏 Acknowledgments

* UCI Machine Learning Repository
* MLflow
* FastAPI
* Streamlit

---

<p align="center">
  <strong>Made with ❤️ for Cybersecurity</strong>
</p>

<p align="center">
  <sub>Built to explore end-to-end machine learning systems</sub>
</p>


