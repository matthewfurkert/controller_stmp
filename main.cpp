#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "gpio/gpiofactory.h"
#include "gpio/lightshow.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Gpio::IGpioPin* gpioRed = Gpio::GpioFactory::createPin(4);
    Gpio::IGpioPin* gpioOrange = Gpio::GpioFactory::createPin(6);
    Gpio::IGpioPin* gpioGreen = Gpio::GpioFactory::createPin(3);
    LightShow* lightShow = new LightShow(&app);
    lightShow->setGPIOs(gpioRed, gpioOrange, gpioGreen);
    engine.rootContext()->setContextProperty("gpioRed", gpioRed);
    engine.rootContext()->setContextProperty("gpioOrange", gpioOrange);
    engine.rootContext()->setContextProperty("gpioGreen", gpioGreen);
    engine.rootContext()->setContextProperty("lightShow", lightShow);


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("controller", "Main");

    return app.exec();
}
