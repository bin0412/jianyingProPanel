import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
Rectangle {
    id: cartoonRectangle;
    width: 800;
    height: 800;
    border.color: "gray";

    Loader {
        id: cartoonLoader;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 5;

    }
    // 初始展现 入场 页面
    Component.onCompleted: cartoonLoader.sourceComponent = cartoonEntry;

    // 入场 界面
    Component {
        id: cartoonEntry;
        CartoonEntry {

        }
    }
    // 出场 界面
    Component {
        id: cartoonExit;
        CartoonExit {

        }
    }
    // 组合 界面
    Component {
        id: cartoonCombine;
        CartoonExit {

        }
    }

    TabBar {
        width: cartoonRectangle.width - 20;
        anchors.left: cartoonRectangle.left;
        anchors.leftMargin: 10;
        anchors.top: cartoonRectangle.top;
        anchors.topMargin: 5;

        TabButton {
            text: "入场"
            onClicked: cartoonLoader.sourceComponent = cartoonEntry;
        }
        TabButton {
            text: "出场"
            onClicked: cartoonLoader.sourceComponent = cartoonExit;
        }
        TabButton {
            text: "组合"
            onClicked: cartoonLoader.sourceComponent = cartoonCombine;
        }
    }
}
