# main.py
from fastapi import FastAPI
from fastapi import HTTPException
from pydantic import BaseModel
import numpy as np

app = FastAPI()

class Item(BaseModel):
    name: str
    price: float

@app.get("/")
def hello():
    return {"message": "Hello 👋"}

@app.post("/items")
def create(item: Item):
    return {"ok": True, "item": item}

def fft_at_k(k,n,L):
    return k+n+L

@app.get("/fft")
def fft_endpoint(n: int = 4096, L: float = 2*np.pi, k: int = 0):
    """
    Compute FFT of sin(5x)*cos(9x) on [0,L) with N samples and return the value at harmonic k.
    - n: number of samples
    - L: domain length
    - k: harmonic index (e.g., 0, ±4, ±14). Maps to FFT bin m ≈ k*L/(2π).
    """
    try:
        return fft_at_k(k=k, n=n, L=L)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))
    
