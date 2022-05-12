import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Rectangle {
    width: 800;
    height: 800;
    border.color: "red";

//    Loader {// 动态加载组件
//        id: audioLoader;
//        anchors.left: parent.left;
//        anchors.leftMargin: 10;
//        anchors.top: parent.top;
//        anchors.topMargin: 50;
//    }

    ScrollView{ // 使用 scrollview 作为底层控件，将所有的控件按顺序编写好
        id: scroll;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.right: parent.right;
        anchors.rightMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 15;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 10;
        clip: true;
        CheckBox {
            id: audioCheckBox;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.top: parent.top;
        }
        Text {
            id: audioText;
            anchors.left: audioCheckBox.right;
            anchors.leftMargin: 2;
            anchors.top: parent.top;
            width: 50;
            text: "基础";
        }

        Image {
            id: locationReset;
            anchors.right: parent.right;
            anchors.rightMargin: 80;
            width: 30;
            height: width;
            source: "https://img-blog.csdnimg.cn/2446a39f046d46528b3f95e0e02ab4f1.png";
            fillMode: Image.PreserveAspectFit;
            visible: audioCheckBox.checkState === Qt.Checked;
            MouseArea { // 停留1s出现提示
                property bool entered: false;
                hoverEnabled: true;
                anchors.fill: parent;
                onEntered: {
                    entered = true;
                }
                onExited: {
                    entered = false;
                }
                ToolTip {
                    visible: parent.entered;
                    text: "重置";
                    delay: 1000;
                }
                onClicked: {
                    console.log("reseting...")
                }
            }
        }

        KeyFrame {
            id: stdKeyFrame;
            anchors.right: parent.right;
            anchors.rightMargin: 10;
            visible: audioCheckBox.checkState === Qt.Checked;
        }
    }
}
