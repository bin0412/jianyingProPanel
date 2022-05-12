import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
Rectangle {
    id: speedRectangle;
    width: 800;
    height: 800;
    border.color: "gray";

    Loader {
        id: speedLoader;
        anchors.left: parent.left; // 与 主窗口 Window 左对齐
        anchors.leftMargin: 10;// 与 主窗口 左留白 10 px
        anchors.top: parent.top;// top方向锚定在主 TabBar 底部
        anchors.topMargin: 5; // top方向留白 5 px

    }
    // 初始展现 常规变速 页面
    Component.onCompleted: speedLoader.sourceComponent = speedRegular;

    //常规变速 界面
    Component {
        id: speedRegular;
        SpeedRegular {

        }
    }

    //曲线变速 界面
    Component {
        id: speedCurve;
        SpeedCurve {

        }
    }

    TabBar {
        id: speedBar;
        width: parent.width - 20;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 5;

        TabButton {
            property int count: 0;
            id: speedTB;
            text: "常规变速";
            onClicked: {
                speedLoader.sourceComponent = speedRegular;
            }
        }
        TabButton {
            text: "曲线变速";
            onClicked: speedLoader.sourceComponent = speedCurve;
        }
    }
}
