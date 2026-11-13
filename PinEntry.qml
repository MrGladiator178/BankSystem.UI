import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MyBank 1.0

Rectangle {
    color: "#5DADE2"
    property string accountType: ""
    property var currentAccount: (accountType === "check") ? check : save
    property int attempts: 0
    property int start: 2

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "Введите PIN-код"
            color: "white"
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: pinInput
            placeholderText: "****"
            echoMode: TextInput.Password
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Ввести"
            Layout.alignment: Qt.AlignHCenter
            enabled: attempts < 3
            onClicked: {
                var pin = parseInt(pinInput.text)
                var total = start - attempts

                if (currentAccount.checkPin(pin)) {
                    stack.push(mainMenuPage, { currentAccount: currentAccount })
                }
                else {
                    attempts++
                    pinInput.text = ""
                    errorText.text = "Неправильный PIN-код! Осталось попыток: " + total
                    errorText.font.pixelSize = 15
                    if (attempts >= 3) {
                        errorText.text = ("Счёт заблокирован! Вызываем полицию!")
                        errorText.color = "#117A65"
                    }
                }
            }
        }

        Text {
            id: errorText
            color: "red"
            font.pixelSize: 25
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
