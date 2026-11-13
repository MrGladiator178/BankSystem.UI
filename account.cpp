#include "account.h"

Account::Account(QObject* parent) : QObject(parent), m_balance(0), m_pin(0) {}

bool Account::deposit(double sum) {
    if (sum <= 0) {
        emit errorText("Введите положительную сумму!");
        return false;
    }
    m_balance += sum;
    emit balanceChanged();
    return true;
}

bool Account::withdraw(double sum) {
    if (sum <= 0) {
        emit errorText("Сумма должна быть положительной");
        return false;
    }
    int total = sum + getCommission(sum);
    if (total > m_balance) {
        emit errorText("Недостаточно средств");
        return false;
    }
    m_balance -= total;
    emit balanceChanged();
    return true;
}

bool Account::checkPin(int pin) {
    return pin == m_pin;
}

CheckingAccount::CheckingAccount(QObject* parent) : Account(parent) {
    m_pin = 1234;
    m_balance = 30000;
}

SavingAccount::SavingAccount(QObject* parent) : Account(parent) {
    m_pin = 8800;
    m_balance = 50000;
}