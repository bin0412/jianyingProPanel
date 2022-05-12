import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0
Rectangle {
    id: rec;
    property int init_times_sliderValue : 1; // 滑动条初始值
    property int init_duration_sliderValue: 4;

    Loader {
        id: speedRegularLoader;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 20;
    }
    Rectangle {
        id: rect1;
        anchors.fill: parent;
        width: parent.width;
        height: parent.height;
        TextSliderSpin {
            anchors.top: parent.top;
            anchors.topMargin: 20;
            anchors.left: parent.left;

            id: times;
            text: "倍数";
            slider_from: 0.1;
            slider_to: 9.0;
            slider_value: 1;
            slider_stepSize: 0.225;
            spin_stepSize: 1;
        }

        TextSliderSpin {
            id: duration;
            anchors.left: times.left;
            anchors.top: times.bottom;
            anchors.topMargin: 45;

            text: "时长";
            slider_from: 0;
            slider_to: 9;
            slider_value: 4;
            slider_stepSize: 0.225;
            spin_stepSize: 1;
        }

        TextSwitch {
            id: voiceModify;
            text: "声音变调";
            anchors.left: duration.left;
            anchors.top: duration.bottom;
            anchors.topMargin: 60;
            fontPixelSize: 15;

        }

        Button {
            width: 60;
            visible: true;

            anchors.right: voiceModify.right;
            anchors.rightMargin: 30;
            anchors.top: voiceModify.bottom;
            anchors.topMargin: 620;
            text: "重置";

            onClicked: {
                times.slider_value = init_times_sliderValue;
                duration.slider_value = init_duration_sliderValue;
            }
        }
    }
}
