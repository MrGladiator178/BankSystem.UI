import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    color: "#5DADE2"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10
        Text {
            text: "Выберите счёт"
            color: "white"
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Расчётный счёт"
            hoverEnabled: false
            Layout.fillWidth: true
            onClicked: {
                stack.push(pinEntryPage, {
                               accountType: "check" })
            }
        }

        Button {
            text: "Сберегательный счёт"
            hoverEnabled: false
            Layout.fillWidth: true
            onClicked: {
                stack.push(pinEntryPage, {
                               accountType: "save" })
            }
        }
    }
}
