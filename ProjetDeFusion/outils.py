import os
import uuid
from pathlib import Path
from PyPDF2 import PdfMerger


def dossier_telechargements() -> Path:
    """Retourne le chemin du dossier Téléchargements de l'utilisateur."""
    home = Path.home()

    if os.name == "nt":  # Windows
        dl_path = home / "Downloads"
    else:  # Linux / macOS
        if (home / "Téléchargements").exists():
            dl_path = home / "Téléchargements"
        else:
            dl_path = home / "Downloads"

    return dl_path


def fusionner_pdfs(pdf1: str, pdf2: str):
    """Fusionne deux fichiers PDF et retourne (succès, chemin du fichier ou erreur)."""
    try:
        nom_unique = f"merged_{uuid.uuid4().hex[:8]}.pdf"
        sortie = dossier_telechargements() / nom_unique

        merger = PdfMerger()
        merger.append(pdf1)
        merger.append(pdf2)
        merger.write(str(sortie))
        merger.close()

        return True, str(sortie)
    except Exception as e:
        return False, str(e)
