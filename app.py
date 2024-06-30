from __future__ import absolute_import, unicode_literals
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QIcon
from PySide6.QtCore import QObject, Slot
import sys
import crossfiledialog
import os
from steganography.steganography import Steganography
import pymsgbox


# Linking Python to Qml
class backend(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.path = None    

    @Slot()
    def getImage(self):     
        self.path = crossfiledialog.open_file("Choose Image", os.path.expanduser("~/"), ["*.png", "*.jpg", "*.jpeg"])
        print(self.path)

    @Slot(str)
    def encodeData(self, data):
        Steganography.encode(self.path, self.path+"encoded.jpg", data)
        pymsgbox.alert("Mission Successful, Agent!", "Operation Successful", button="OK")



# Initialising App
app = QApplication(sys.argv)
app.setWindowIcon(QIcon("assets/icon.png"))

# Initializing Qml View and loading Qml UI
window = QQmlApplicationEngine()
window.quit.connect(app.quit)

brain = backend()
window.rootContext().setContextProperty("python", brain)

window.load("assets/ui.qml")


# Closing the Event Loop
sys.exit(app.exec())