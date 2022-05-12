import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Rectangle{
    id: rec;
    width: 780;
    height: 780;
    Rectangle{
        visible: true
        width: 780
        height: 780

        Rectangle {
            id: splitLine;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.right: parent.right;
            anchors.rightMargin: 10;
            anchors.top: parent.top;
            anchors.topMargin: 5;
            color: "gray";
            height: 1;
        }

        ScrollView{ // 使用 scrollview 作为底层控件，将所有的控件按顺序编写好
            id: scroll;
            anchors.left: parent.left;
            anchors.leftMargin: splitLine.anchors.leftMargin;
            anchors.right: parent.right;
            anchors.rightMargin: splitLine.anchors.rightMargin;
            anchors.top: splitLine.bottom;
            anchors.topMargin: 15;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10;
            clip: true;
            CheckBox {
                id: locationCheckBox;
                anchors.left: parent.left;
                anchors.leftMargin: splitLine.anchors.leftMargin;
                anchors.top: parent.top;
            }
            Text {
                id: locationText;
                anchors.left: locationCheckBox.right;
                anchors.leftMargin: 2;
                anchors.top: parent.top;
                width: 50;
                text: "位置大小";
            }

            Image {
                property int initXY: 0
                property int zoom: 100
                property int spin: 2

                id: locationReset;
                anchors.right: parent.right;
                anchors.rightMargin: 80;
                width: 30;
                height: width;
                source: "https://img-blog.csdnimg.cn/2446a39f046d46528b3f95e0e02ab4f1.png";
                fillMode: Image.PreserveAspectFit;
                visible: locationCheckBox.checkState === Qt.Checked;
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
                        //locationReset.initXY
                        //locationCol.
                    }
                }
            }

            KeyFrame {
                id: stdKeyFrame;
                anchors.right: parent.right;
                anchors.rightMargin: 10;
                visible: locationCheckBox.checkState === Qt.Checked;
            }
            Column {
                id: locationCol;
                width: parent.width;
                height: parent.height - 600;
                opacity: (locationCheckBox.checked ? 1 : 0.2); // 根据checkbox的选择情况设定控件的不透明度
                anchors.top: locationCheckBox.bottom;
                anchors.topMargin: 10;
                anchors.left: parent.left;
                anchors.leftMargin: locationCheckBox.anchors.leftMargin;
                spacing: 25;

                Rectangle {
                    width: parent.width;
                    height: 30;
                    Text {
                        id: text1;
                        anchors.left: parent.left;
                        anchors.leftMargin: 10;
                        anchors.verticalCenter: parent.verticalCenter;
                        text: "缩放";
                    }
                    Slider {
                        id: slider1;
                        anchors.left: text1.right;
                        anchors.leftMargin: 20;
                        anchors.right: spinbox1.left;
                        anchors.rightMargin: 40;
                        anchors.verticalCenter: parent.verticalCenter;
                        from: 1
                        to: 500
                        value: 100;
                        enabled: locationCheckBox.checkState === Qt.Checked;
                        onValueChanged: {
                            spinbox1.value = slider1.value;
                        }
                    }
                    SpinBox {
                        id: spinbox1;
                        value: 100;
                        width: 100;
                        editable: true;
                        enabled: locationCheckBox.checkState === Qt.Checked;
                        anchors.right: keyframe1.left;
                        anchors.rightMargin: 22;
                        anchors.verticalCenter: parent.verticalCenter;
                        from: 1;
                        to: 500;
                        z: 1;

                        onValueChanged:  {
                            slider1.value = spinbox1.value; // 将spinbox的修改同步到slider中
                        }
                    }
                    Text {
                        id: unit;
                        text: "%";
                        width: 10;
                        anchors.right: spinbox1.right;
                        anchors.rightMargin: spinbox1.anchors.rightMargin + 30;
                        anchors.verticalCenter: parent.verticalCenter;

                        z: 2;
                    }
                    KeyFrame {
                        id: keyframe1;
                        anchors.right: parent.right;
                        anchors.rightMargin: 2 * stdKeyFrame.anchors.rightMargin;
                        visible: locationCheckBox.checkState === Qt.Checked;
                    }
                }
                Rectangle {
                    width: parent.width;
                    height: 30;
                    Text {
                        id: text2;
                        anchors.left: parent.left;
                        anchors.leftMargin: 10;
                        anchors.verticalCenter: parent.verticalCenter;
                        text: "位置";
                    }

                    Text {
                        id: xTxt;
                        text: "X";
                        color: "gray"
                        anchors.left: text2.right;
                        anchors.leftMargin: 30;
                        anchors.verticalCenter: parent.verticalCenter;
                    }

                    SpinBox {
                        id: xspinbox;
                        from: 0
                        to: 100
                        value: 0
                        stepSize: 1
                        editable: true
                        enabled: locationCheckBox.checkState === Qt.Checked;
                        anchors.left: xTxt.right
                        anchors.leftMargin: 5;
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        id: yTxt;
                        text: "Y";
                        color: xTxt.color;
                        anchors.right: yspinbox.left;
                        anchors.rightMargin: 5;
                        anchors.verticalCenter: parent.verticalCenter;
                    }

                    SpinBox { // y spinbox选择与缩放行的spinbox右靠拢
                        id: yspinbox;
                        from: 0
                        to: 100
                        value: 0
                        stepSize: 1;
                        enabled: locationCheckBox.checkState === Qt.Checked;
                        anchors.right: keyframe2.left;
                        anchors.rightMargin: 20;
                        anchors.verticalCenter: parent.verticalCenter;
                    }
                    KeyFrame {
                        id: keyframe2;
                        anchors.right: parent.right;
                        anchors.rightMargin: 2 * stdKeyFrame.anchors.rightMargin;// 与标准关键帧右留白2倍关系
                        visible: locationCheckBox.checkState === Qt.Checked;
                    }
                }
                Rectangle {
                    width: parent.width;
                    height: 30;
                    Text {
                        id: spin;
                        text: "旋转";
                        anchors.left: parent.left;
                        anchors.leftMargin: 10;
                        anchors.verticalCenter: parent.verticalCenter;
                    }
                    SpinBox {
                        id: spinbox2;
                        anchors.left: spin.right;
                        anchors.leftMargin: slider1.anchors.leftMargin + 20;// 引用slider1的左留白
                        anchors.verticalCenter: parent.verticalCenter;
                        width: spinbox1.width;
                        from: 0;
                        to: 360;
                        value: 2;
                        enabled: locationCheckBox.checkState === Qt.Checked;
                        onValueChanged: {
                            dial.value = value;
                        }
                    }
                    Text {
                        id: degree; // 度数符号
                        anchors.left: spinbox2.left;
                        anchors.leftMargin: 18;
                        anchors.verticalCenter: parent.verticalCenter;
                        text: "    °"
                    }

                    Dial {
                        id: dial;
                        from: 0;
                        to: 360;
                        anchors.right: keyframe3.right;
                        anchors.rightMargin: 160;
                        width: 30
                        height: 30;
                        enabled: locationCheckBox.checkState === Qt.Checked;
                        onValueChanged: {
                            spinbox2.value = value;
                        }
                    }

                    KeyFrame {
                        id: keyframe3
                        anchors.right: parent.right;
                        anchors.rightMargin: 2 * stdKeyFrame.anchors.rightMargin;
                        visible: locationCheckBox.checkState === Qt.Checked;
                    }
                }
            }

            Rectangle { // 第二条分割线
                id: splitLine1;
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                anchors.right: parent.right;
                anchors.rightMargin: 10;
                anchors.top: locationCol.bottom;
                anchors.topMargin: 5;
                color: "gray";
                height: 1;
            }

            Rectangle {
                anchors.left: splitLine1.left;
                anchors.right: splitLine1.right;
                anchors.top: splitLine1.bottom;
                anchors.topMargin: 10;
                anchors.bottom: parent.bottom;
                CheckBox {
                    id: mixCheckBox;
                    anchors.left: parent.left;
                    anchors.leftMargin: splitLine.anchors.leftMargin;
                    anchors.top: parent.top;
                }
                Text {
                    id: mixText;
                    anchors.left: mixCheckBox.right;
                    anchors.leftMargin: 2;
                    anchors.top: parent.top;
                    width: 50;
                    text: "混合";
                }

                Image {
                    id: mixReset;
                    anchors.right: parent.right;
                    anchors.rightMargin: 80;
                    width: 30;
                    height: width;
                    source: "https://img-blog.csdnimg.cn/2446a39f046d46528b3f95e0e02ab4f1.png";
                    fillMode: Image.PreserveAspectFit;
                    visible: mixCheckBox.checkState === Qt.Checked;
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
                    id: keyframe4
                    anchors.right: parent.right;
                    anchors.rightMargin: 10;
                    visible: mixCheckBox.checkState === Qt.Checked;

                }

                Column {
                    id: mixCol;
                    width: parent.width;
                    height: 300;
                    opacity: (mixCheckBox.checked ? 1 : 0.2); // 根据checkbox的选择情况设定控件的不透明度
                    anchors.top: mixCheckBox.bottom;
                    anchors.topMargin: 10;
                    anchors.left: parent.left;
                    anchors.leftMargin: mixCheckBox.anchors.leftMargin;
                    spacing: 25;

                    Rectangle {
                        width: parent.width;
                        height: 30;
                        Text {
                            id: mixModel;
                            text: "混合模式";
                            anchors.verticalCenter: parent.verticalCenter;
                        }
                        ComboBox {
                            anchors.left: mixModel.right;
                            anchors.leftMargin: 30;
                            anchors.right: parent.right;
                            anchors.rightMargin: 50;
                            anchors.verticalCenter: parent.verticalCenter;
                            model: ["正常", "变亮", "滤色", "变暗", "叠加", "强光", "柔光", "颜色加深", "线性加深","颜色减淡", "正片叠底"];

                        }
                    }

                    Rectangle {
                        width: parent.width;
                        height: 30;
                        Text {
                            id: text3;
                            anchors.left: parent.left;
                            anchors.leftMargin: 10;
                            anchors.verticalCenter: parent.verticalCenter;
                            text: "不透明度";
                        }
                        Slider {
                            id: slider3;
                            anchors.left: text3.right;
                            anchors.leftMargin: 20;
                            anchors.right: spinbox3.left;
                            anchors.rightMargin: 40;
                            anchors.verticalCenter: parent.verticalCenter;
                            from: 1
                            to: 500
                            value: 100;
                            enabled: mixCheckBox.checkState === Qt.Checked;
                            onValueChanged: {
                                spinbox3.value = slider3.value;
                            }
                        }
                        SpinBox {
                            id: spinbox3;
                            value: 100;
                            width: 100;
                            editable: true;
                            enabled: mixCheckBox.checkState === Qt.Checked;
                            anchors.right: keyframe5.left;
                            anchors.rightMargin: 22;
                            anchors.verticalCenter: parent.verticalCenter;
                            from: 1;
                            to: 500;
                            z: 1;


                            onValueChanged:  {
                                slider3.value = spinbox3.value; // 将spinbox的修改同步到slider中
                            }
                        }
                        Text {
                            id: unit3;
                            text: "%";
                            width: 10;
                            anchors.right: spinbox3.right;
                            anchors.rightMargin: spinbox3.anchors.rightMargin + 30;
                            anchors.verticalCenter: parent.verticalCenter;

                            z: 2;
                        }
                        KeyFrame {
                            id: keyframe5;
                            anchors.right: parent.right;
                            anchors.rightMargin: 2 * stdKeyFrame.anchors.rightMargin;
                            visible: mixCheckBox.checkState === Qt.Checked;
                        }

                    }
                }
            }
        }
    }
}

