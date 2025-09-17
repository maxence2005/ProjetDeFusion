import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    Layout.fillWidth: true
    height: 120
    radius: 12
    color: "#f8f8f5"
    border.width: 2

    property string pdfPath: ""

    signal pdfSelected(string path)


    MouseArea {
        anchors.fill: parent
        onClicked: {
            var path = backend.ouvrir_dialog_pdf()
            if (path) {
                root.pdfPath = path
                plusSymbol.text = "✔"
                root.pdfSelected(path)
            }
        }
    }

    border.color: "#bb3333"

    Text {
        id: plusSymbol
        anchors.centerIn: parent
        text: root.pdfPath ? "✔" : "+"
        font.pixelSize: 48
        color: "#bb3333"
        font.bold: true
    }
}
