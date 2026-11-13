import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    color: "#5DADE2"

    ColumnLayout {
        spacing: 4
        anchors.centerIn: parent

        Text {
            text: "СберБанк"
            color: "#27AE60"
            font.pixelSize: 25
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: "Добро пожаловать"
            color: "#E67E22"
            font.pixelSize: 35
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Начать"
            font.pixelSize: 10
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                stack.push(accountSelectPage)
            }
        }
    }
}
