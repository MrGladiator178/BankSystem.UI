#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "account.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<CheckingAccount>("MyBank", 1, 0, "CheckingAccount");
    qmlRegisterType<SavingAccount>("MyBank", 1, 0, "SavingAccount");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("VseSam", "Main");

    return QGuiApplication::exec();
}
