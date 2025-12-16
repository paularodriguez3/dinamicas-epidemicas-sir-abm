import os
import pandas as pd
import matplotlib.pyplot as plt
from dotenv import load_dotenv

# Cargar variables del .env
load_dotenv()

# Leer ruta desde el .env
path = os.getenv("CSV_PATH")

if path is None:
    raise ValueError("No se encontró CSV_PATH en el archivo .env")

# Leer todo como texto
with open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

# Encontrar dónde empiezan los datos reales
start_idx = None
for i, line in enumerate(lines):
    if line.strip().startswith('"x","y","color"'):
        start_idx = i + 1
        break

if start_idx is None:
    raise ValueError("No se encontró el inicio de los datos")

# Leer datos a partir de ahí
data = pd.read_csv(
    path,
    skiprows=start_idx,
    header=None
)

time = data[0]
susceptible = data[1]
infected = data[5]
recovered = data[9]

# Plot
plt.figure()
plt.plot(time, susceptible, label="Susceptible")
plt.plot(time, infected, label="Infected")
plt.plot(time, recovered, label="Recovered")

plt.xlabel("Time (ticks)")
plt.ylabel("Number of agents")
plt.legend()
plt.tight_layout()
plt.show()
