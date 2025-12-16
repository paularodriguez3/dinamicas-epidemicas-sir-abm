# Dinámicas epidémicas emergentes en un modelo SIR espacial basado en agentes

Este repositorio acompaña al trabajo **“Dinámicas epidémicas emergentes en un modelo SIR espacial basado en agentes”**.

El objetivo del estudio es analizar cómo patrones epidémicos macroscópicos, como picos de infección, ondas espaciales y extinción del brote, pueden emerger a partir de interacciones locales simples entre individuos en movimiento, utilizando un modelo SIR mínimo basado en agentes.

---

## Documento principal

El artículo completo del trabajo se encuentra en:

- `paper/Dinamicas_epidemicas_modelo_SIR_ABM.pdf`

En él se describen:
- El contexto teórico.
- El diseño del modelo.
- La metodología experimental.
- Los resultados obtenidos.
- La discusión de las dinámicas emergentes observadas.

---

## Estructura del repositorio

```text
SIR_MODEL
├── data/
│   ├── inf_prob_0.1.csv
│   ├── inf_prob_0.2.csv
│   └── inf_prob_0.3.csv
│
├── models/
│   ├── sir_model.nlogo
│   └── sir_model.nlogox
│
├── paper/
│   └── Dinamicas_epidemicas_modelo_SIR_ABM.pdf
│
├── results/
│   ├── plots/
│   │   ├── inf_prob_0.1.png
│   │   ├── inf_prob_0.2.png
│   │   └── inf_prob_0.3.png
│   │
│   └── snapshots/
│       ├── world_initial.png
│       ├── world_peak.png
│       └── world_final.png
│
├── src/
│   └── graph.py
│
└── README.md
```

---

## Descripción del modelo

El modelo implementa un **modelo epidemiológico SIR espacial basado en agentes** en NetLogo. Cada agente representa un individuo que se mueve aleatoriamente en un espacio bidimensional continuo y puede encontrarse en uno de tres estados epidemiológicos:

* **S**: Susceptible
* **I**: Infectado
* **R**: Recuperado

La transmisión ocurre mediante interacciones locales dentro de un radio fijo y está gobernada por una probabilidad de infección. Los agentes infectados se recuperan tras un tiempo de recuperación fijo y adquieren inmunidad.

El tiempo avanza en pasos discretos (*ticks*), siguiendo la convención habitual en modelos basados en agentes.

---

## Modelos NetLogo

* `models/sir_model.nlogo`
  Implementación principal del modelo SIR espacial basado en agentes.

* `models/sir_model.nlogox`
  Configuración de **BehaviorSpace** utilizada para ejecutar experimentos variando la probabilidad de infección.

---

## Datos

El directorio `data/` contiene los archivos CSV generados a partir de las simulaciones en NetLogo para distintos valores de la probabilidad de infección.

Estos archivos recogen la evolución temporal del número de agentes susceptibles, infectados y recuperados.

---

## Resultados

* `results/plots/`
  Curvas epidémicas agregadas que muestran la evolución temporal de los compartimentos S, I y R.

* `results/snapshots/`
  Capturas del estado espacial del sistema en momentos clave del brote:

  * Estado inicial.
  * Pico epidémico.
  * Estado final.

---

## Análisis y visualización

El script `src/graph.py` procesa los archivos CSV generados por NetLogo y produce las gráficas incluidas en el directorio `results/plots/`.

### Requisitos

* Python 3.x
* pandas
* matplotlib

---

## Reproducibilidad

1. Ejecutar el modelo (`sir_model.nlogo`) o los experimentos de BehaviorSpace (`sir_model.nlogox`) en NetLogo.
2. Exportar los resultados en formato CSV y guardarlos en `data/`.
3. Ejecutar el script `graph.py` para generar las figuras.

---

## Autora

Paula Rosa Rodríguez Morales
