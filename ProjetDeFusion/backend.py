from PyQt6.QtCore import QObject, pyqtSlot, pyqtSignal
from PyQt6.QtWidgets import QFileDialog
from .outils import fusionner_pdfs, dossier_telechargements


class PDFMergerBackend(QObject):
    pdf1_changed = pyqtSignal(str)
    pdf2_changed = pyqtSignal(str)
    merge_enabled_changed = pyqtSignal(bool)
    merge_result = pyqtSignal(bool, str)

    def __init__(self):
        super().__init__()
        self.pdf1 = ""
        self.pdf2 = ""

    @pyqtSlot(str, int)
    def set_pdf(self, path: str, idx: int):
        if idx == 1:
            self.pdf1 = path
            self.pdf1_changed.emit(path)
        elif idx == 2:
            self.pdf2 = path
            self.pdf2_changed.emit(path)

        self.merge_enabled_changed.emit(bool(self.pdf1 and self.pdf2))

    @pyqtSlot()
    def merge_pdfs(self):
        if not (self.pdf1 and self.pdf2):
            self.merge_result.emit(False, "Veuillez sélectionner deux fichiers PDF.")
            return
        success, message = fusionner_pdfs(self.pdf1, self.pdf2)
        self.merge_result.emit(success, message)

    @pyqtSlot(result=str)
    def ouvrir_dialog_pdf(self):
        file, _ = QFileDialog.getOpenFileName(None, "Choisir un PDF", str(dossier_telechargements()), "PDF files (*.pdf)")
        return file
