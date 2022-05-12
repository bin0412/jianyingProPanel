import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0


Rectangle {
    width: 780;
    height: 780;
    ListModel {
        id: gridModel
    }
    property url defaultSource: "https://img-blog.csdnimg.cn/e3064bc4dd8b4162bf8159de1d54a9f2.png";
    property url liwu: "https://img-blog.csdnimg.cn/7dd4a4a084a9423da3aab48b7e934611.png"
    property url denglong: "https://img-blog.csdnimg.cn/8f391751b31b489cb8991eff929a05db.png"
    property url hongbao: "https://img-blog.csdnimg.cn/40cab9fd7e0b44c290ed41773ff59254.png"
    property url bianpao: "https://img-blog.csdnimg.cn/80d9d242e9ca4df79f5f1fee0c8677ab.png"
    property url kongmingdeng: "https://img-blog.csdnimg.cn/65bb13f4005b427aa2123b2c00854907.png"
    property url fengche: "https://img-blog.csdnimg.cn/11940f6a8a8840758f53c7f642884952.png"
    Component.onCompleted: { // 数据
        gridModel.append({"txt": "无", "sources": defaultSource, "myIndex": 0});
        gridModel.append({"txt": "礼物", "sources": liwu, "myIndex": 1});
        gridModel.append({"txt": "灯笼", "sources": denglong, "myIndex": 2});
        gridModel.append({"txt": "红包", "sources": hongbao, "myIndex": 3});
        gridModel.append({"txt": "鞭炮", "sources": bianpao, "myIndex": 4});
        gridModel.append({"txt": "孔明灯", "sources": kongmingdeng, "myIndex": 5});
        gridModel.append({"txt": "风车", "sources": fengche, "myIndex": 6});

    }

    GridView {
        id: gridView;
        anchors.fill: parent
        anchors.leftMargin: 20;
        anchors.rightMargin: 20;
        //property Rectangle selectedImage: rec1;
        model: gridModel
        property int index: 0; // 初始选择索引为0的控件
        property int itemWidth: 100;
        property int itemHeight: itemWidth + 20 // 高比宽多20
        property int itemSpacing: 40; // 控件之间间隔
        cellWidth: itemWidth + itemSpacing;
        cellHeight: itemHeight + itemSpacing;
        currentIndex: 0;
        delegate: Rectangle { // 定义UI布局
            width: 100;
            height: width + 20;
            property int indexs: myIndex;
            border.color: ((gridView.currentIndex === indexs) ? "aqua" : "white");
            border.width: 2;
            Image {
               id: image;
               width: parent.width
               height: parent.height - myText.height;
               anchors.left: parent.left;
               anchors.top: parent.top;
               fillMode: Image.PreserveAspectFit;
               source: sources;
            }
            Text {
                id: myText;
                anchors.top: image.bottom;
                height: 20;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: txt
            }

            MouseArea {
                anchors.fill: parent;
                onClicked:  {
                    // 改变 gridView的currentIndex属性，通过该属性的改变间接改变外层Rectangle的边界颜色
                   gridView.currentIndex = parent.indexs;
                }
            }
        }
    }
}
