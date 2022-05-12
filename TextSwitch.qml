import QtQuick 2.15
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: rec;
    width: 800;
    border.color: "red";

    property alias text: myText.text; // 设置左侧显示的文本
    property alias fontPixelSize: myText.font.pixelSize;

    Rectangle {
        id: mainRec;
        width: parent.width;
        Text {
            id: myText;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            text: "...";
            font.pixelSize: 20;

        }
        Switch {
            anchors.right: parent.right;
            anchors.rightMargin: 40;
            anchors.top: parent.top;
            anchors.topMargin: myText.anchors.topMargin;
        }
    }
}
