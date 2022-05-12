import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Rectangle {
    width: 780
    height: 780
    Loader {
        id: adjustBasicLoader;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
    }
    Rectangle {
        width: parent.width;
        height: parent.height;
        anchors.left: parent.left;
        anchors.right: parent.right;

        anchors.top: parent.top;
        CheckBox {
            id: checkbox;
            anchors.left: parent.left;
            anchors.top: parent.top;
            anchors.leftMargin: 5;
            anchors.topMargin: 5;
            checkState: Qt.Checked;
            onClicked: {
                lutCol.opacity = checkState ? 1 : 0.35;
            }
        }
        Text {
            anchors.left: checkbox.right
            anchors.top: checkbox.top;
            anchors.topMargin: checkbox.anchors.topMargin;

            text: qsTr("LUT");

        }

        Item {
            anchors.right: parent.right;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            anchors.rightMargin: 60;

            anchors.horizontalCenter: checkbox.Center;
            Image {
                width: 20;
                height: 20;
                fillMode: Image.PreserveAspectFit;
                source: "https://img-blog.csdnimg.cn/2446a39f046d46528b3f95e0e02ab4f1.png";
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {

                    }
                }
            }

        }
        Column {
            id: lutCol;
            anchors.left: parent.left
            anchors.leftMargin: 5;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            height: parent.height;
            anchors.top: checkbox.bottom;
            anchors.topMargin: 5;
            anchors.bottom: parent.bottom;


            spacing: 10;
            Rectangle {
                width: parent.width;
                height: 50;
                Text {
                    id: name;
                    text: "名称";
                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                    anchors.verticalCenter: parent.verticalCenter;
                }

                ComboBox {
                    anchors.left: name.right;
                    anchors.leftMargin: 25;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.topMargin: 5;
                    anchors.right: parent.right;
                    anchors.rightMargin: 30;
                    model: ["无"];
                }
            }
            Rectangle {
                id: strengthRec;
                opacity: 0.2;
                width: parent.width;
                height: 50;
                Text {
                    id: strengthText;
                    text: "强度"
                    anchors.left: parent.left;
                    anchors.leftMargin: 5;
                    anchors.verticalCenter: parent.verticalCenter;
                }
                Slider {
                    id: strengthSlider;
                    from: 0;
                    to: 100;
                    anchors.left: strengthText.right;
                    anchors.leftMargin: 20;
                    anchors.verticalCenter: parent.verticalCenter;
                    value: 100;

                }
                SpinBox {
                    id: strengthSpin;
                    from: strengthSlider.from;
                    to: strengthSlider.to;
                    anchors.left: strengthSlider.right;
                    anchors.leftMargin: 10;
                    anchors.verticalCenter: parent.verticalCenter;
                    value: 100;

                }
            }
            Rectangle {
                id: protectRec;
                width: parent.width;
                height: 50;

                Text {
                    id: skinProtect;
                    text: "肤色保护";

                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    anchors.verticalCenter: parent.verticalCenter;

                }
                Text {
                    id:  tips
                    text: qsTr("(打开使肤色更自然)")
                    opacity: 0.4;

                    anchors.left: skinProtect.right;
                    anchors.leftMargin: 15;
                    anchors.verticalCenter: parent.verticalCenter;
                }
                Switch {
                    anchors.right: parent.right;
                    anchors.rightMargin: 20;
                    anchors.verticalCenter: parent.verticalCenter;
                }

            }
        }
    }
}
