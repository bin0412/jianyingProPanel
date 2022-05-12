import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Image {

    property url defaultEffect: "https://img-blog.csdnimg.cn/0b69b4a7eebe45fe97be89f8b854214d.png";
    id: insertKeyFrame;
    width: 30;
    height: width;
    // anchors.right: parent.right;
    // anchors.rightMargin: 10;
    source: defaultEffect;
    fillMode: Image.PreserveAspectFit;
    Rectangle {
        id: cycle;
        anchors.centerIn: parent;
        width: 10;
        height: 10;
        radius: 3;
        color: "gray";
        // 区域未被选中 且 鼠标进入到范围内 才显现灰色圆块
        visible: (mouseArea.selected === false && mouseArea.entered);
    }

    MouseArea {
        property url selectedEffect: "https://img-blog.csdnimg.cn/a3d0581b211f4689be74d0907cd6ca2d.png";

        id: mouseArea;
        property bool entered: false;
        property bool selected: false;// 默认非选中
        hoverEnabled: true;
        anchors.fill: parent;

        onEntered: {
            entered = true;
        }
        onExited: {
            entered = false;
        }
        onClicked: {
            selected = !selected;
            if(selected) {
                parent.source = selectedEffect;
            }
            else {
                parent.source = defaultEffect;
            }
        }

        ToolTip {
            visible: parent.entered;
            text: "插入关键帧";
            delay: 1000;
        }
    }
}
