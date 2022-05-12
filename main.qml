import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
Window {
    id: root;
    title: "剪映专业版";
    width: 800;
    height: 800;
    property int mainWinWidth: 800;
    property int mainWinHeight: 800;
    Loader {// 动态加载器
        id: myLoader;
        anchors.left: parent.left;// 锚定在window左侧
        anchors.top: parent.top;// 锚定在window顶端
        anchors.topMargin: 20;// 顶端留白 20px
    }

    Component.onCompleted: myLoader.sourceComponent = picture; //一开始显示“画面”界面

   // 画面 界面 - Component
    Component {
        id: picture;
        Picture {

        }
    }
    // 音频 界面 - Component
    Component {
        id: audio;
        Audio {

        }
    }
    // 变速 界面 - Component
    Component {
        id: speed;
        Speed {

        }
    }

    Component {
        id: cartoon;
        Cartoon {

        }
    }

    Component {
        id: adjust;
        Adjust {

        }
    }

    TabBar {
        id: mainTB;
        width: 600;

        TabButton {
            id: tb1;
            text: "画面";
            onClicked: myLoader.sourceComponent = picture; // 切换到 画面页面
        }
        TabButton {
            id: tb2;
            text: "音频";
            onClicked: myLoader.sourceComponent = audio;
        }
        TabButton {
            text: "变速";
            onClicked: myLoader.sourceComponent = speed;
        }
        TabButton {
            text: "动画";
            onClicked: myLoader.sourceComponent = cartoon;
        }
        TabButton {
            text: "调节";
            onClicked: myLoader.sourceComponent = adjust;
        }
    }
}
