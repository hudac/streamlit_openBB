FROM python:3.9-slim

RUN apt-get update -y && \
    apt-get install -y gcc libwebkit2gtk-4.0-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt --no-cache-dir

WORKDIR /app

COPY pages pages
COPY Streamlit_App.py Streamlit_App.py

ENV PYTHONUNBUFFERED="True"
ENV STREAMLIT_SERVER_PORT="8080"
CMD streamlit run Streamlit_App.py
