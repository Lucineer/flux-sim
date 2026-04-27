# flux-sim — Multi-Agent Coordination Simulator

**GPU-accelerated simulation framework for discovering fundamental laws of multi-agent coordination.**

Based on 130+ experimentally validated laws from CUDA simulations on Jetson Orin.

## The Grand Unifying Principle

```
Performance = √(Acquisition × Sharing) / (1 + Interference)
```

This is multiplicative, not additive. Optimizing sharing without acquisition = zero performance.

## Quick Start

```bash
# Compile and run default experiment
make
./flux-sim --agents 4096 --food 400 --steps 3000 --world 256

# Run with DCS
./flux-sim --agents 4096 --food 400 --dcs --steps 3000

# Run experiment sweep
./flux-sim --sweep perception --range 6,12,24,48,96 --steps 2000
```

## Core Concepts

### The Coordination Hierarchy
1. **Perception** — Always first. Limited perception reverses everything.
2. **Exploration** — Systematic beats random 2-3x. Ballistic > Lévy in bounded worlds.
3. **Memory** — 2-slot conditional fallback. Conflicts with shared info.
4. **Stigmergy** — Environmental traces. Works with migration. More noise-fragile.
5. **DCS** — Shared communication. 7 strict conditions. Zero noise tolerance.

### The 7 DCS Conditions
DCS only helps when ALL are met simultaneously:
1. Dense world (agent density > 1.0)
2. Static or fast-respawning resources
3. Scattered (not clustered) distribution
4. Uniform agent capabilities (any heterogeneity kills DCS)
5. Perfect communication (zero noise)
6. Single shared point (K=1-2, multi-slot hurts)
7. Moderate movement speed (speed > 3 causes overshoot)

### Key Laws
- **Law 60**: DCS Paradox — info sharing most valuable when least needed
- **Law 94**: True limited perception reverses coordination hierarchy
- **Law 99**: Omniscience premium (10-14x) is biggest single factor
- **Law 115**: Greedy optimality — go-to-nearest always dominates
- **Law 85**: Efficiency cap at 19-26% of theoretical maximum

## Architecture

```
src/
  sim.cu          — Core simulation engine (CUDA)
  config.h        — Configuration and parameter sweep
  laws.h          — All 130+ laws with validation criteria
  metrics.cu      — Performance measurement and analysis
  visualize.py    — Real-time visualization
experiments/
  experiment-template.cu — Template for new experiments
  dcs_baseline.cu       — DCS baseline (Law 2)
  perception_limit.cu   — True limited perception (Laws 94-95)
  adversarial_resonance.cu — Misinformation injection (proposed)
  foresight_plateau.cu  — Temporal foresight sweep (proposed)
  compression_optimal.cu — Info compression ratio (proposed)
docs/
  GRAND-UNIFYING-PRINCIPLE.md
  DCS-DESIGN-THEORY.md
  COORDINATION-HIERARCHY.md
  IGNORANCE-ARCHITECTURE.md
laws/
  all-laws.md    — Complete 130+ law catalog
  validated/     — Experimentally confirmed laws
  proposed/      — Hypotheses awaiting validation
```

## Requirements
- CUDA 12.x (tested on Jetson Orin, sm_87)
- 8GB+ GPU memory
- gcc/g++ (host compiler)

## License
MIT

## Citation
If you use flux-sim in research, please cite the 130 laws of multi-agent emergent coordination.

---

## Fleet Context

Part of the Lucineer/Cocapn fleet. See [fleet-onboarding](https://github.com/Lucineer/fleet-onboarding) for boarding protocol.

- **Vessel:** JetsonClaw1 (Jetson Orin Nano 8GB)
- **Domain:** Low-level systems, CUDA, edge computing
- **Comms:** Bottles via Forgemaster/Oracle1, Matrix #fleet-ops
