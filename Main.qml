import QtQuick
import QtQuick.Controls
import MyBank 1.0

ApplicationWindow {
    visible: true
    width: 600
    height: 600
    title: "БАНКОМАТ"

    CheckingAccount {
        id: check
    }
    SavingAccount {
        id: save
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: welcomePage
    }

    Component {
        id: welcomePage
        Welcome {}
    }
    Component {
        id: accountSelectPage
        AccountSelect {}
    }
    Component {
        id: pinEntryPage
        PinEntry {}
    }
    Component {
        id: mainMenuPage
        MainMenu {}
    }
    Component {
        id: depositingCashPage
        DepositingCash {}
    }
    Component {
        id: withdrawingCashPage
        WithdrawingCash {}
    }
}
