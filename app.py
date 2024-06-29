from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
import sys

# Initialising App
app = QApplication(sys.argv)

# Initializing Qml View and loading Qml UI
window = QQmlApplicationEngine()
window.quit.connect(app.quit)
window.load("assets/ui.qml")

# Closing the Event Loop
sys.exit(app.exec())
