# Scénarios et modélisation du climat dans les rapports du GIEC

[🤖 Conversation avec ChatGPT](https://chatgpt.com/share/68892c3a-ad54-8001-9c79-be25ab26d0f7)

## Description des modèles

## What Are Climate Models?

Climate models are computational tools that simulate the Earth’s climate system to understand past changes and project future conditions under various scenarios. The Intergovernmental Panel on Climate Change (IPCC) uses these models to inform its assessment reports, notably the Assessment Reports (ARs) released every ~6–7 years.

### Types of Climate Models
A. Mechanistic / Process-Based Models (Most Common)

These models simulate climate based on physical principles like thermodynamics, fluid dynamics, and radiative transfer.

    General Circulation Models (GCMs)

        Simulate atmospheric and oceanic processes on a 3D grid.

        Include components for atmosphere, ocean, land surface, and sea ice.

        Example: NASA’s ModelE, NCAR’s CESM.

    Earth System Models (ESMs)

        Extend GCMs by including the carbon cycle, vegetation, atmospheric chemistry, etc.

        Allow feedback loops between climate and biosphere.

        Example: MPI-ESM, UKESM1.

B. Earth System Models of Intermediate Complexity (EMICs)

    Simplified compared to ESMs, often lower-resolution.

    Useful for long timescales (e.g., paleoclimate).

    Trade detail for computational efficiency.

C. Statistical and Empirical Models

    Use historical data and statistical relationships to predict future outcomes.

    Do not simulate physics explicitly.

    Often used for regional or sectoral projections (e.g., agriculture, hydrology).

D. Machine Learning & Data-Driven Models (Emerging)

    Learn from large datasets to predict climate behavior.

    Still in early stages of integration in IPCC-style assessments.

    Pros: Speed, resolution.

    Cons: Lack of interpretability and physical grounding.

E. Black Box Models (Rare in IPCC Use)

    Models with internal mechanisms that are not explicitly interpretable.

    Generally avoided in IPCC reporting due to lack of transparency and traceability.


## Diagramme du workflow

```
                       ┌────────────────────────────┐
                       │   Qualitative Narratives   │
                       │   (e.g. SSP1, SSP2, SSP5)  │
                       └────────────┬───────────────┘
                                    │
                                    ▼
                      ┌──────────────────────────────┐
                      │      SOCIOECONOMIC INPUTS    │
                      │  - Population                │
                      │  - GDP growth                │
                      │  - Urbanization              │
                      │  - Technology assumptions    │
                      │  - Energy/farming demand     │
                      └────────────┬─────────────────┘
                                   │
                                   ▼
                ┌─────────────────────────────────────────────┐
                │       INTEGRATED ASSESSMENT MODELS (IAMs)   │
                │     (MESSAGE, REMIND, GCAM, IMAGE, etc.)    │
                └─────────────────────────────────────────────┘
                            │        │          │
          ┌─────────────────┘        │          └───────────────────┐
          ▼                          ▼                              ▼
 ┌────────────────┐        ┌────────────────────┐         ┌────────────────────┐
 │ Energy system  │        │ Land use / forests │         │ GHG emissions      │
 │ - Tech mix     │        │ - Crops, pasture   │         │ - CO₂, CH₄, N₂O    │
 │ - Fossil fuels │        │ - Deforestation    │         │ - Aerosols         │
 └────────────────┘        └────────────────────┘         └────────────────────┘
          \                        |                               /
           \                       |                              /
            \                      ▼                             /
             \        ┌──────────────────────────────┐         /
              \──────▶│  EMISSIONS & CONCENTRATIONS  │◀───────
                      │  - CO₂, CH₄, N₂O (ppm/ppb)   │
                      │  - Radiative forcing (W/m²)  │
                      └────────────┬─────────────────┘
                                   │
                                   ▼
                 ┌──────────────────────────────────────┐
                 │        CLIMATE MODELS (GCMs/ESMs)    │
                 │ (CESM, UKESM1, MPI-ESM, etc.)        │
                 └──────────────────────────────────────┘
                             │
                             ▼
              ┌──────────────────────────────────────┐
              │     CLIMATE PROJECTIONS (OUTPUT)     │
              │  - Temperature (global/regional)      │
              │  - Precipitation patterns             │
              │  - Sea level rise                     │
              │  - Ice/snow cover                     │
              │  - Extreme events                     │
              └──────────────────────────────────────┘
```


## Ressources

* [Scenarios in IPCC assessments: lessons from AR6 and opportunities for AR7](https://www.nature.com/articles/s44168-023-00082-1)
  
* [IPCC Scenarios Data Explorer](https://ourworldindata.org/explorers/ipcc-scenarios)

* [Carbon brief: Socioeconomic Pathways Explainer](https://www.carbonbrief.org/explainer-how-shared-socioeconomic-pathways-explore-future-climate-change/)