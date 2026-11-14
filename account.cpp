#include "account.h"
#include <vector>
#include <string>
using namespace std;

Account::Account(QObject* parent) : QObject(parent), m_balance(0), m_pin(0) {}

void Account::addOperation(const QString& record) {
    m_operations.append(record);
}

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
    addOperation("Внесение наличных: " + QString::number(sum) + " рублей.");
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
    addOperation("Снятие наличных: " + QString::number(sum) + " рублей.");
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