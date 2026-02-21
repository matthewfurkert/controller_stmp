#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "gpio/gpiofactory.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Gpio::IGpioPin* gpioPin = Gpio::GpioFactory::createPin(14);
    engine.rootContext()->setContextProperty("gpioPin", gpioPin);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("controller", "Main");

    return app.exec();
}
