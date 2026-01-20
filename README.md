## Docker

### Prerequisites
- Install Docker Desktop for Windows and ensure it is running.
- Have a Docker Hub account (for pushing images).

### Build the image
```bash
docker build -t network-security-app:latest .
```

### Run locally
```bash
docker run --rm -p 8000:8000 \
	-e MONGODB_URL_KEY="<your-mongodb-connection-uri>" \
	-v %CD%\prediction_output:/app/prediction_output \
	network-security-app:latest
```

Open http://localhost:8000/docs to access the FastAPI docs.

### Tag and push to Docker Hub
```bash
docker login
docker tag network-security-app:latest <your-dockerhub-username>/network-security-app:latest
docker push <your-dockerhub-username>/network-security-app:latest
```

Replace `<your-dockerhub-username>` and `<your-mongodb-connection-uri>` accordingly.
