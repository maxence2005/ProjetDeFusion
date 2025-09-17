import sys
from PyQt6.QtCore import QUrl
from PyQt6.QtWidgets import QApplication
from PyQt6.QtQml import QQmlApplicationEngine

from .backend import PDFMergerBackend

def main():
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()

    backend = PDFMergerBackend()
    engine.rootContext().setContextProperty("backend", backend)

    engine.load(QUrl("ProjetDeFusion/qml/App.qml"))
    if not engine.rootObjects():
        return -1

    return app.exec()
