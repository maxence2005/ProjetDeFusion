import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: root
    width: 200
    height: 50
    text: "Fusionner"
    enabled: true

    onClicked: {
        backend.merge_pdfs()
    }

    background: Rectangle {
        radius: 8
        color: root.enabled ? "#d1d1d1" : "#e6e6e6"
        border.color: "#aaaaaa"
        border.width: 1
    }

    contentItem: Text {
        text: root.text
        anchors.centerIn: parent
        font.pixelSize: 16
        font.bold: true
        color: root.enabled ? "#333333" : "#777777"
    }
}
