from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QIcon
from PySide6.QtCore import QObject, Slot
import sys
import crossfiledialog
import os
from stegano import lsb
import threading
from plyer import notification



# Linking Python to Qml
class backend(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.path = None
        self.message = None

    @Slot()
    def getImage(self):     
        self.path = crossfiledialog.open_file("Choose Image", os.path.expanduser("~/"), ["*.png"])
        print(self.path)

    @Slot(str)
    def encodeData(self, message: str):
        if self.path != None and message != None:
            self.message = message
            thread = threading.Thread(target=self.encode_image, args=())
            thread.start()

    @Slot()
    def decodeDate(self):
        decoded_message = lsb.reveal(self.path)
        window.rootObjects()[0].setProperty("msgText", decoded_message)
        # notification.notify(
        #     title="Decoding Successful!",
        #     message=f"Image decoded succesfully!",
        #     app_name="Steganographer"
        # )

    def encode_image(self):
        encoded_img = lsb.hide(self.path, self.message)
        encoded_img.save(self.path[0:-4] + "-encoded" + ".png")
        notification.notify(
            title="Encoding Successful!",
            message=f"Encoded image saved as \"{self.path[0:-4]}-encoded.png\"",
            app_name="Steganographer"
        )



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