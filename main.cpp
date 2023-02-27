#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSurfaceFormat>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSurfaceFormat format;
    format.setSamples(0);
    QSurfaceFormat::setDefaultFormat(format);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/PultInterface/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    //Register types

    //Init

    engine.addImportPath("qrc:/qmldir");

    engine.load(url);

    return app.exec();
}
