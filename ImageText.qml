import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: mainRec;
    visible: true;
    width: 160;
    height: 190;// 增加的 20用于显示text文本
    property alias myImageURL : animated.source;
    property alias myText : textText.text;
    property alias myWidth: animateRec.width; // 动画 + 文本 -> Rectangle 的宽度 默认160
    property alias myHeight: animateRec.height; // ~~~ 的高度  默认 190
    Rectangle {
        id: animateRec;
        width: parent.width;
        height: parent.height - 20; // 留下 20 给予文本控件
        anchors.top: parent.top;
        anchors.left: parent.left;

        border.width: 4;
        border.color: "gray";

        AnimatedImage {
            property int surplus : 10;// 留白大小
            width: parent.width - surplus; // 宽和高都预留 10px 用于凸显边框效果
            height: parent.height - surplus;
            id: animated;
            anchors.top: parent.top;
            anchors.topMargin: surplus / 2;// top、left 方向均需要留白 surplus / 2
            anchors.left: parent.left;
            anchors.leftMargin: surplus / 2;
            asynchronous: true;
            fillMode: Image.PreserveAspectCrop;
            playing: false;// 初始为暂停
            source: "https://img-blog.csdn.net/20141202123525968?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZm9ydW9r/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center";
        }

        MouseArea {
            anchors.fill: animated; // 动画播放区域都属于鼠标响应范围
            hoverEnabled: true;
            onEntered: {
                animated.currentFrame = 0;// 从头播放
                animated.paused = false;
                animated.playing = true;
                animateRec.border.color = "red";
            }
            onExited: {
                animated.paused = true;
                animated.playing = false;
                animateRec.border.color = "gray";
            }
        }
    }

    Rectangle{
        width: parent.width;
        height: 25;

        anchors.left: mainRec.left;
        anchors.top: animateRec.bottom;
        anchors.topMargin: 5; // 与 gif动画的距离

        Text {
            id: textText;
            //anchors.left: parent.left;
            anchors.centerIn: parent;
            text: "默认文本";
        }
    }
}

