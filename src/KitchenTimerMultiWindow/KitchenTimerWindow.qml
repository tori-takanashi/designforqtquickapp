﻿import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
// C++で公開登録したクラスをインポート
import tech.relog.plugin.kitchentimer 1.0

ApplicationWindow {
  visible: true
  width: 400
  height: 200
  title: qsTr("Kitchen Timer Multi Window")
  //背景色の変更
  color: timer.fired ? "#ee9999" : "white"

  //カウント時間の設定用エイリアス
  property alias countTime: timer.countTime
  //上位へ情報を伝えるシグナル                     [1]
  signal started(int countTime)

  //残り時間の表示とスタート・クリアボタンの配置
  GridLayout {
    anchors.fill: parent
    anchors.margins: 10
    columns: 2
    Label {
      id: remainLabel
      Layout.fillWidth: true
      Layout.columnSpan: 2
      horizontalAlignment: Text.AlignHCenter
      font.pointSize: 64
      text: timer.remainTimeString
    }
    Button {
      id: startButton
      Layout.fillWidth: true
      text: "Start"
      enabled: !timer.running
      onClicked: timer.start()
    }
    Button {
      id: clearButton
      Layout.fillWidth: true
      text: "Clear"
      enabled: timer.running
      onClicked: timer.clear()
    }
  }
  //残り時間をカウントするとタイマー機能
  KitchenTimer {
    id: timer
    //動作中になったらシグナルを発呼   [2]
    onRunningChanged: {
      if(running){
        started(countTime)
      }
    }
  }
}
