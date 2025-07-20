# Molecular Docking Workflow

This repository provides **`run_docking.sh`**, a Bash script that sets up and runs **AutoDock Vina** for any protein–ligand project.  
All key parameters live at the top of the script so you can adapt the workflow to your own target and library.

---

## Folder overview

| Folder           | Purpose                                    |
|------------------|--------------------------------------------|
| `data/`          | Input files (`protein.pdb`, ligands in SDF or MOL2) |
| `scripts/`       | Helper tools for preparation (optional)    |
| `results/`       | Logs, PDBQT poses, score summary           |
| `notebooks/`     | Jupyter notebooks for post-docking analysis |

You can change this layout. The script uses environment variables at the top that point to each folder.

---

## Scripts in this repo

run_docking.sh

---

## Quick start

```bash
-Clone the repo
git clone https://github.com/Abtint/AutoDock-Vina-to-dock-small-molecules-into-the-binding-pocket-of-a-target-protein.git
cd AutoDock-Vina-to-dock-small-molecules-into-the-binding-pocket-of-a-target-protein

-Make the script executable
chmod +x run_docking.sh

-Edit the first lines of run_docking.sh if you need a new grid center or size
nano run_docking.sh   # or any text editor

-run docking
./run_docking.sh
```

## Requirements & Recommendations  
| Software                                       | Version tested | Notes                                    |
| ---------------------------------------------- | -------------- | ---------------------------------------- |
| AutoDock Vina                                  | 1.2.5          | GPU build is optional                    |
| Open Babel                                     | 3.1.1          | Used for file conversion and protonation |
| Bash                                           | ≥ 4            | Linux or WSL(Linux us preferred)         |
| *(optional)* Python 3 + `pandas`, `jupyterlab` | –              | For interactive result inspection        |
| *(optional)* BIOVIA Visualizer                 | 2024           | For 3-D interaction analysis             |


## Output files
#results/<ligand_name>.log   Vina log with per-mode scores
#results/<ligand_name>_pose.pdbqt Best pose in PDBQT format
#results/summary.csv   Table with the top score for every ligand


## Troubleshooting
| Symptom                        | Possible cause             | Suggested fix                                      |
| ------------------------------ | -------------------------- | -------------------------------------------------- |
| `vina: command not found`      | Vina not in `PATH`         | `which vina` after activating conda environment    |
| Grid too small, ligand clipped | `SIZE` values too low      | Increase box size values                           |
| All scores are zero            | Receptor or ligand missing | Check that both PDBQT files exist and are readable |

## License 
Released under the MIT License. 

## Citation
Tondar, A. 2025. https://github.com/Abtint/AutoDock-Vina-to-dock-small-molecules-into-the-binding-pocket-of-a-target-protein




