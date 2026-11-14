import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MyBank 1.0

Rectangle {
    color: "#5DADE2"
    property var currentAccount: null

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: "Какую сумму Вы хотите внести:"
            color: "white"
            font.pixelSize: 15
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: sumInput
            echoMode: TextInput.Normal
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Внести"
            font.pixelSize: 15
            Layout.fillWidth: true
            onClicked: {
                var sum = parseInt(sumInput.text)
                if (currentAccount.correctDeposit(sum)) {
                    currentAccount.deposit(sum)
                    depositSuccess.text = "Баланс пополнен на " + sumInput.text + " рублей"
                }

            }
        }

        Button {
            text: "Выйти"
            Layout.fillWidth:true
            font.pixelSize: 15
            onClicked: {
                stack.pop()
            }
        }

        Text {
            id: depositSuccess
            color: "darkred"
            font.pixelSize: 10
        }

        Connections {
            target: currentAccount
            function onErrorText(message) {
                depositSuccess.text = message
                depositSuccess.color = "red"
            }
        }
    }
}
