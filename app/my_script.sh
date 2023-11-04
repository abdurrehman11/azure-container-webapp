#!/bin/sh
set -e
service ssh start

# Run your application using uvicorn
exec uvicorn app.main:app --host 0.0.0.0 --port 7860