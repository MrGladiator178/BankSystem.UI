#ifndef ACCOUNT_H
#define ACCOUNT_H

#include <QObject>
#include <QString>

class Account : public QObject {
    Q_OBJECT
    Q_PROPERTY(double balance READ getBalance NOTIFY balanceChanged)
    Q_PROPERTY(QString accountType READ getAccountType CONSTANT)

public:
    explicit Account(QObject* parent = nullptr);

    virtual double getBalance() const {
        return m_balance;
    }

    virtual QString getAccountType() const = 0;
    virtual double getCommission(double sum) const = 0;

    Q_INVOKABLE bool deposit(double sum);
    Q_INVOKABLE bool withdraw(double sum);
    Q_INVOKABLE bool checkPin(int pin);

signals:
    void balanceChanged();
    void errorText(QString message);

protected:
    double m_balance;
    int m_pin;
};

class CheckingAccount : public Account {
    Q_OBJECT
public:
    explicit CheckingAccount(QObject* parent = nullptr);
    double getCommission(double sum) const override {
        return 0.01;
    }
    QString getAccountType() const override {
        return "Расчётный";
    }
};

class SavingAccount : public Account {
    Q_OBJECT
public:
    explicit SavingAccount(QObject* parent = nullptr);
    double getCommission(double sum) const override {
        return 0.005;
    }
    QString getAccountType() const override {
        return "Сберегательный";
    }
};

#endif
