import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
Rectangle {
    id: pictureRectangle;
    width: 800;
    height: 800;
    border.color: "red";
    Loader {// 动态加载组件
        id: pictureLoader;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 50;
    }
    // 初始时显示 基础 界面
    Component.onCompleted: pictureLoader.sourceComponent = pictureBasic;

    Component {
        id: pictureBasic;
        PictureBasic {

        }
    }

    Component {
        id: pictureAdjust;
        PictureAdjust { }
    }

    Component {
        id: pictureBackGround;
        PictureBackGround { }
    }

    Component {
        id: pictureMask;
        PictureMask { }
    }

    TabBar {
        id: viewTB;
        width: parent.width - 20;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 5;
        TabButton {
            id: baseTB;
            text: "基础";
            onClicked: pictureLoader.sourceComponent = pictureBasic;
        }
        TabButton {
            id: imageTB;
            text: "抠像";
            onClicked: pictureLoader.sourceComponent = pictureAdjust;
        }
        TabButton {
            id: maskTB;
            text: "蒙版";
            onClicked: pictureLoader.sourceComponent = pictureMask;
        }
        TabButton {
            id: backgroundTB;
            text: "背景";
            onClicked: pictureLoader.sourceComponent = pictureBackGround;
        }
    }
}
