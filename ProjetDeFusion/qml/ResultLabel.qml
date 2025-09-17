import QtQuick 2.15

Text {
    id: root
    property bool success: false

    color: success ? "#4a4a4a" : "#aa3333"
    font.pixelSize: 14
    font.italic: true
}
