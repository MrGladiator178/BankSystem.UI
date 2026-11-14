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
            text: "Главное меню"
            color: "white"
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 30
        }

        Button {
            text: "Показать баланс"
            Layout.fillWidth: true
            onClicked: {
                balanceText.text = "Баланс: " + currentAccount.balance + " рублей"
            }
        }

        Button {
            text: "Пополнить баланс"
            Layout.fillWidth: true
            onClicked: {
                stack.push(depositingCashPage, {currentAccount: currentAccount })
            }
        }

        Button {
            text: "Снять наличные"
            Layout.fillWidth: true
            onClicked: {
                stack.push(withdrawingCashPage, {currentAccount: currentAccount })
            }
        }

        Button {
            text: "История операций"
            Layout.fillWidth: true
            onClicked: {
                historyText.text = currentAccount.showHistory().join("\n")
            }
        }

        Button {
            text: "Выйти"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                stack.pop(null)
            }
        }

        Text {
            id: balanceText
            color: "#117A65"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
        }

        Text {
            id: historyText
            color: "#117A65"
            anchors.horizontalCenter: parent.HorizontalCenter
            font.pixelSize: 18
            wrapMode: Text.Wrap
        }
    }
}
