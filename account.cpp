#include "account.h"

Account::Account(QObject* parent) : QObject(parent), m_balance(0), m_pin(0) {}

bool Account::correctDeposit(double sum) {
    if (sum <= 0) {
        emit errorText("Введите положительную сумму!");
        return false;
    }
    return true;
}

void Account::deposit(double sum) {
    m_balance += sum;
    emit balanceChanged();
}

bool Account::correctWithdraw(double sum) {
    if (sum <= 0) {
        emit errorText("Сумма должна быть положительной");
        return false;
    }
    if (sum > m_balance) {
        emit errorText("Недостаточно средств");
        return false;
    }
    return true;
}

void Account::withdraw(double sum) {
    m_balance -= sum;
    emit balanceChanged();
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