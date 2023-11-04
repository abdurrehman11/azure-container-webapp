import os
from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    container_time = os.environ.get("WEBSITES_CONTAINER_START_TIME_LIMIT")
    web_port = os.environ.get("WEBSITES_PORT")

    return {
        "Hello": "World, how are you!!!",
        "container_time": container_time,
        "web_port": web_port,
        "CICD": "Deployed via Github CI/CD"
    }


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    files = len(os.listdir("/home"))
    return {"item_id": item_id, "q": q, "files": f"Total files # {files}"}
