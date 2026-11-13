import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MyBank 1.0

Rectangle {
    color: "#5DADE2"

    property string accountType: ""
    property var currentAccount: (accountType === "check") ? check : save

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: "Какую сумму Вы хотите снять:"
            color: "white"
            font.pixelSize: 18
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: withdrawSumInput
            anchors.horizontalCenter: parent.horizontalCenter
            echoMode: TextInput.Normal
        }

        Button {
            text: "Снять"
            Layout.fillWidth: true
            font.pixelSize: 15
            onClicked: {
                var sum = parseInt(withdrawSumInput.text)
                if (currentAccount.withdraw(sum)) {
                    withdrawSuccess.text = "Успешно выдано " + withdrawSumInput.text + " рублей"
                }
            }
        }

        Button {
            text: "Назад"
            Layout.fillWidth: true
            font.pixelSize: 15
            onClicked: {
                stack.pop()
            }
        }

        Text {
            id: withdrawSuccess
            color: "#117A65"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 13
        }
    }

    Connections {
        target: currentAccount
        function onErrorText(message) {
            withdrawSuccess.text = message
            withdrawSuccess.color = "red"
        }
    }
}
