import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0


Rectangle {
    width: 780;
    height: 780;
    Rectangle {
        id: splitLine;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.leftMargin: 10;
        anchors.rightMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 5;
        color: "gray";
        height: 1;
    }

    Rectangle {
        anchors.left: splitLine.left;
        anchors.right: splitLine.right;
        anchors.top: splitLine.bottom;
        height: 70;
        Text {
            id:  fillText
            text: qsTr("背景填充")
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.verticalCenter: parent.verticalCenter;
        }
        Text {
            id: apply;
            text: "应用全部";
            width: 50;
            color: "gray";
            anchors.right: parent.right;
            anchors.rightMargin: 20;
            anchors.verticalCenter: parent.verticalCenter;
            MouseArea {
                anchors.fill: parent;
                onClicked: {

                }
            }
        }
        ComboBox {
            anchors.top: fillText.bottom;
            anchors.topMargin: 10;
            anchors.left: parent.left;
            anchors.leftMargin: fillText.anchors.leftMargin;
            anchors.right: parent.right;
            anchors.rightMargin: apply.anchors.rightMargin;
            model: ["无", "模糊","颜色","样式"];
            focus: false;
            flat: true
        }

    }

}
