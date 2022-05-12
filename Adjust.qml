import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: adjustRectangle;
    width: 800;
    height: 800;
    border.color: "gray";

    Loader {
        id: adjustLoader;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 20;
    }

    // 初始展现 常规变速 页面
    Component.onCompleted: adjustLoader.sourceComponent = adjustBasic;

    //基础 界面
    Component {
        id: adjustBasic;
        AdjustBasic {

        }
    }

    //HSL 界面
    Component {
        id: adjustHSL;
        AdjustHSL {

        }
    }
    //曲线 界面
    Component {
        id: adjustCurve;
        AdjustCurve {

        }
    }

    TabBar {
        width: parent.width - 20;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 5;

        TabButton {
            text: "基础"
            onClicked: {
                adjustLoader.sourceComponent = adjustBasic;
            }
        }
        TabButton {
            text: "HSL"
            onClicked:{
                adjustLoader.sourceComponent = adjustHSL;
            }
        }
        TabButton {
            text: "曲线"
            onClicked: {
                adjustLoader.sourceComponent = adjustCurve;
            }
        }
    }

}
