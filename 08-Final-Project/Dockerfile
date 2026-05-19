# 1. Start from a formal, lightweight Python image
FROM python:3.9-slim

# 2. Specify the work folder inside the container
WORKDIR /app

# 3. Copy the first order file to take advantage of the cache
COPY app/requirements.txt .

# 4. Setup the requirements
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY app/ .

# 6. Open Port 5000 to the world
EXPOSE 5000

# 7. The command will run the application as soon as the controller is up# 7. The command will run the application as soon as the controller is up
CMD ["python", "app.py"]
