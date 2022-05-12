import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.2

Rectangle{
    id: rec;
    width: 800;
    property alias text: myText.text; // 显示的文本
    property alias slider_from: mySlider.from; // from ~ to 区间
    property alias slider_to:  mySlider.to;
    property alias slider_value : mySlider.value; // 滑动条初始值
    property alias slider_stepSize : mySlider.stepSize;
    property alias slider_snapMode : mySlider.snapMode;

    property alias spin_stepSize: spinbox.stepSize;

    Text {
        id: myText;
        text: "倍数";
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 10;
    }
    Rectangle {
        width: parent.width;
        anchors.left: myText.left;
        anchors.top: myText.bottom;
        anchors.topMargin: 10;
        Slider {
            id: mySlider;
            anchors.left: parent.left;
            anchors.horizontalCenter: parent.Center;
            width: parent.width - (spinbox.width + spinbox.anchors.leftMargin) - 50;
            from: 0.1;
            to: 9.0;
            value: 1;
            stepSize: 0.225;
            orientation:Qt.Horizontal;
            snapMode: Slider.NoSnap;

            onValueChanged: {// 当值发生改变
                spinbox.value = value;
            }
        }

        SpinBox {
            id: spinbox;
            width: 100;
            editable: true;// 设置为可编辑
            anchors.left: mySlider.right;
            anchors.leftMargin: 20;
            anchors.horizontalCenter: parent.Center;
            from: mySlider.from;
            to: mySlider.to;
            value: 1;
            stepSize: 1;
            signal editingFinished();
            onEditingFinished: {// 对value编辑成功之后同步到 slider
                mySlider.value = spinbox.value;
            }
            onValueChanged: {// 对value修改成功之后同步到 slider
                mySlider.value = spinbox.value;
            }
        }
    }
}
