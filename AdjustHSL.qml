import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Rectangle {
    width: 780
    height: 780

    Rectangle {
        id: splitLine;
        width: parent.width;
        height: 2;
        anchors.left: parent.left;
        anchors.top: parent.top
        anchors.topMargin: 5;
        color: "black"
    }


    ListModel {
        id: gridModel;
    }
    Component.onCompleted: {// 添加数据
        gridModel.append({"myIndex": 0, "myColor": "red"});
        gridModel.append({"myIndex": 1, "myColor": "yellow"});
        gridModel.append({"myIndex": 2, "myColor": "green"});
        gridModel.append({"myIndex": 3, "myColor": "blue"});
        gridModel.append({"myIndex": 4, "myColor": "aqua"});
        gridModel.append({"myIndex": 5, "myColor": "darkturquoise"});
        gridModel.append({"myIndex": 6, "myColor": "lightseagreen"});
    }

    GridView {
        property int index: 0; // 初始选择索引为0的控件
        property int itemWidth: 50;
        property int itemHeight: itemWidth // 宽高相等
        property int itemSpacing: 40; // 控件之间间隔

        id: gridView;
        anchors.top: splitLine.bottom;
        anchors.topMargin: 50;
        width: parent.width - 100;
        height: 100
        anchors.leftMargin: 100;

        model: gridModel
        cellWidth: itemWidth + itemSpacing;
        cellHeight: itemHeight + itemSpacing;
        currentIndex: 0;

        delegate: Rectangle { // 定义UI布局
            property int indexs: myIndex;// 每个控件的索引
            property color colors: myColor;//每个控件的颜色

            id: outRec; // 外矩形
            width: gridView.itemWidth;
            height: gridView.itemHeight;
            radius: width / 2;
            //外矩形的边界色取决于是否当前被选中，选中了就是color色，且边界宽度更大
            //未被选中默认为白色, 边界宽度缩小
            border.color: ((gridView.currentIndex === indexs) ? "green" : myColor);
            border.width: ((gridView.currentIndex === indexs) ? 2 : 5);

            color: (gridView.currentIndex === indexs) ? myColor : "white";// 外矩形颜色
            MouseArea {
                anchors.fill: parent;
                onClicked:  {
                    // 改变 gridView的currentIndex属性，通过该属性的改变间接改变外层Rectangle的边界颜色
                    gridView.currentIndex = parent.indexs;
                    hui.fir_color = outRec.color;
                }
            }
        }
    }

    Rectangle {
        property color fir_color: "red";
        property color sec_color: "green";

        id: hui;
        width: parent.width
        height: 100;
        anchors.top: gridView.bottom;
        anchors.topMargin: 50;
        Column {
            Text {
                id: txt1;
                text: "色相";
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                anchors.verticalCenter: parent.verticalCenter;
            }

            Slider {
                id: huiSlider;
                width: 250;
                height: 10;
                anchors.left: txt1.right;
                anchors.leftMargin: 10;
                anchors.verticalCenter: parent.verticalCenter;
                background: Rectangle {
                    width: parent.width;
                    height: 2;
                    gradient: Gradient {
                        orientation: Gradient.Horizontal;
                        GradientStop { // 滑动条渐变色取决于圆圈控件
                            position: 0;
                            color: gridView.itemAtIndex(gridView.currentIndex).color;
                        }
                        GradientStop {
                            position: 1;
                            color: "greenyellow";
                        }
                    }
                }
            }
        }
    }

}
