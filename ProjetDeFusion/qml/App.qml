import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: appWin
    visible: true
    width: 800
    height: 800
    title: "Fusionner deux PDF"
    color: "#f8f8f5"

    property string pdf1Path: ""
    property string pdf2Path: ""
    property bool mergeEnabled: false
    property bool mergeSuccess: false
    property string resultMsg: ""

    ColumnLayout {
        anchors.fill: parent
        spacing: 16
        // padding: 24

        PdfDropBlock {
            id: block1
            pdfPath: pdf1Path
            onPdfSelected: (path) => {
                pdf1Path = path
                backend.set_pdf(path, 1)
            }
        }

        PdfDropBlock {
            id: block2
            pdfPath: pdf2Path
            onPdfSelected: (path) => {
                pdf2Path = path
                backend.set_pdf(path, 2)
            }
        }

        MergeButton {
            Layout.alignment: Qt.AlignHCenter
            enabled: pdf1Path && pdf2Path

        }

        ResultLabel {
            Layout.alignment: Qt.AlignHCenter
            visible: resultMsg !== ""
            success: mergeSuccess
            text: resultMsg
        }

    }

    Connections {
        target: backend
        onMerge_result: function(success, path) {
            mergeSuccess = success
            resultMsg = success ? "Fusion réussie.\nFichier : " + path : "Échec de la fusion : " + path
        }
    }
}
