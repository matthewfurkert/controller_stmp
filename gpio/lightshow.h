#pragma once
#include <QObject>
#include <QVector>
#include "igpiopin.h"   // matches your header

class LightShow : public QObject
{
    Q_OBJECT
public:
    explicit LightShow(QObject *parent = nullptr);

    void setGPIOs(Gpio::IGpioPin* red, Gpio::IGpioPin* orange, Gpio::IGpioPin* green);

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

private:
    void nextStep();
    void allOff();

    struct Pattern {
        bool red, orange, green;
        int delayMs;
    };

    QVector<Pattern> m_sequence;
    int m_step = 0;
    bool m_running = false;

    Gpio::IGpioPin* m_gpioRed = nullptr;
    Gpio::IGpioPin* m_gpioOrange = nullptr;
    Gpio::IGpioPin* m_gpioGreen = nullptr;
};
