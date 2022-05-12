import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Rectangle {
    width: 780;
    height: 780;
    Rectangle {
        id: rec1;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: parent.top;
        height: 300;
        CheckBox {
            id: checkbox;
            anchors.left: parent.left;
            anchors.leftMargin: 5;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            checkState: Qt.Checked;
            onClicked: {
                colorRec.opacity = checkState ? 1 : 0.35;
                reset.visible = checkState;
                tips.visible = checkState;

            }
        }
        Text {
            text: "色度抠图";
            anchors.left: checkbox.right;
            anchors.verticalCenter: checkbox.verticalCenter;
        }
        Item {
            id: reset;
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
            id: col;
            width: parent.width;
            height: parent.height
            anchors.top: checkbox.bottom;
            anchors.topMargin: 10;
            spacing: 50;
            Rectangle {
                id: colorRec;
                width: parent.width;
                height: 30;
                Text {
                    id: colorCollect;
                    text: "取色器";
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    anchors.verticalCenter: parent.verticalCenter;
                }

                Image {
                    width: 30;
                    height: 30;
                    source: "https://img-blog.csdnimg.cn/7e75ecd0f0c746798c0844941a89272e.png";
                    fillMode: Image.PreserveAspectFit;
                    anchors.left: colorCollect.right;
                    anchors.leftMargin: 10;
                    anchors.verticalCenter: parent.verticalCenter;

                }
                Text {
                    id: tips;
                    text: "*先吸取画面颜色，再调节强度"
                    color: "gray";
                    anchors.right: parent.right;
                    anchors.rightMargin: 20;
                    anchors.verticalCenter: parent.verticalCenter;
                }

            }

            Rectangle {
                id: strengthRec;
                width: parent.width;
                height: 30;
                opacity: 0.4;
                Text {
                    id: strength;
                    text: "强度";
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    anchors.verticalCenter: parent.verticalCenter;

                }

                Slider {
                    id: strengthSlider;
                    anchors.left: strength.right;
                    anchors.leftMargin: 50;
                    anchors.right: strengthSpin.left;
                    anchors.rightMargin: 50;
                    anchors.verticalCenter: parent.verticalCenter;
                    enabled: false;
                    from: 0
                    to: 100;
                    value: 0;

                    onValueChanged: {// 当值发生改变
                        strengthSpin.value = value;
                    }
                }
                SpinBox {
                    id: strengthSpin;
                    anchors.right: parent.right;
                    anchors.rightMargin: 20;
                    from: strengthSlider.from;
                    to: strengthSlider.to;
                    enabled: false;
                    value: 0;
                    signal editingFinished();
                    onEditingFinished: {// 对value编辑成功之后同步到 slider
                        strengthSlider.value = strengthSpin.value;
                    }
                    onValueChanged: {// 对value修改成功之后同步到 slider
                        strengthSlider.value = strengthSpin.value;
                    }
                }
            }

            Rectangle {
                opacity: 0.4;
                width: parent.width;
                height: 30;
                Text {
                    id: shadow;
                    text: "阴影";
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    anchors.verticalCenter: parent.verticalCenter;

                }

                Slider {
                    id: shadowSlider;
                    anchors.left: shadow.right;
                    anchors.leftMargin: 50;
                    anchors.right: shadowSpin.left;
                    anchors.rightMargin: 50;
                    anchors.verticalCenter: parent.verticalCenter;
                    enabled: false;
                    from: 0
                    to: 100;
                    value: 0;

                    onValueChanged: {// 当值发生改变
                        shadowSpin.value = value;
                    }
                }
                SpinBox {
                    id: shadowSpin;
                    anchors.right: parent.right;
                    anchors.rightMargin: 20;
                    from: shadowSlider.from;
                    to: shadowSlider.to;
                    enabled: false;
                    value: 0;
                    signal editingFinished();
                    onEditingFinished: {// 对value编辑成功之后同步到 slider
                        shadowSlider.value = shadowSpin.value;
                    }
                    onValueChanged: {// 对value修改成功之后同步到 slider
                        shadowSlider.value = shadowSpin.value;
                    }
                }
            }

        }
    }

    Rectangle {
        id: splitLine2;
        anchors.left: rec1.left;
        anchors.right: rec1.right;
        anchors.leftMargin: 10;
        anchors.rightMargin: 10;
        anchors.top: rec1.bottom;
        anchors.topMargin: 10;
        height: 2;
        color: "gray";

    }

    Rectangle {
        id: smartImage;
        anchors.left: rec1.left;
        anchors.right: rec1.right;
        anchors.top: splitLine2.bottom;
        anchors.topMargin: 10;


        CheckBox {
            id: smartCheckBox;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            checkState: Qt.Checked;
        }

        Text {
            anchors.left: smartCheckBox.right;
            anchors.leftMargin: 4;
            text: "智能图像"
        }

        Text {
            id: smartTips;
            text: "*当前仅支持任务图像的智能识别"
            color: "gray";
            visible: !smartCheckBox.checkState;
            anchors.right: parent.right;
            anchors.rightMargin: 10;

        }
    }
}
