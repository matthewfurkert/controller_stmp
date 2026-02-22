#include "lightshow.h"
#include <QTimer>
#include <QDebug>

LightShow::LightShow(QObject *parent) : QObject(parent)
{
    // === UNIQUE & FUN PATTERN (chase → color pairs → big strobe) ===
    m_sequence = {
        {true,  false, false, 220},   // Red
        {false, true,  false, 160},   // Orange
        {false, false, true,  220},   // Green
        {true,  true,  false, 180},   // Red+Orange
        {false, true,  true,  180},   // Orange+Green
        {true,  false, true,  180},   // Red+Green
        {true,  true,  true,  300},   // ALL ON
        {false, false, false, 140},   // ALL OFF
        {true,  true,  true,   90},   // Fast strobe
        {false, false, false,  90},
        {true,  true,  true,   90},
        {false, false, false, 280}    // Pause
    };
}

void LightShow::setGPIOs(Gpio::IGpioPin* red, Gpio::IGpioPin* orange, Gpio::IGpioPin* green)
{
    m_gpioRed    = red;
    m_gpioOrange = orange;
    m_gpioGreen  = green;
}

void LightShow::start()
{
    if (m_running) return;
    stop();
    m_running = true;
    m_step = 0;
    allOff();
    QTimer::singleShot(30, this, &LightShow::nextStep);
    qDebug() << "🎇 Light Show STARTED – unique chase + strobe pattern!";
}

void LightShow::stop()
{
    m_running = false;
    allOff();
    qDebug() << "Light Show stopped.";
}

void LightShow::nextStep()
{
    if (!m_running) return;

    const Pattern& p = m_sequence[m_step];

    if (m_gpioRed)    m_gpioRed->setValue(p.red);
    if (m_gpioOrange) m_gpioOrange->setValue(p.orange);
    if (m_gpioGreen)  m_gpioGreen->setValue(p.green);

    m_step = (m_step + 1) % m_sequence.size();
    QTimer::singleShot(p.delayMs, this, &LightShow::nextStep);
}

void LightShow::allOff()
{
    if (m_gpioRed)    m_gpioRed->setValue(false);
    if (m_gpioOrange) m_gpioOrange->setValue(false);
    if (m_gpioGreen)  m_gpioGreen->setValue(false);
}
