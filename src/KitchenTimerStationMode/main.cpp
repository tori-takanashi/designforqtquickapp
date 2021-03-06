﻿#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "kitchentimer.h"

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);
  app.setOrganizationName("RELOG");
  app.setOrganizationDomain("relog.tech");
  app.setApplicationName("Kitchen Timer Station Mode");

  //QMLへの公開登録
  qmlRegisterType<KitchenTimer>("tech.relog.plugin.kitchentimer"
                                   , 1, 0, "KitchenTimer");

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
