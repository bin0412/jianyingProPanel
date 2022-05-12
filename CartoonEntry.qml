import QtQuick 2.0
import QtPositioning 5.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2

Rectangle {
    id: mainWin;
    width: 800;
    height: 1000;
    Loader {
        id: cartoonEntryLoader;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 20;
    }

    ScrollView {
        id: scroll;
        width: mainWin.width;

        height: 800;
        clip: true;
        GroupBox {
            property int left_margin: 10;//Grid 控件的左留白
            width: mainWin.width - left_margin * 2;
            height: mainWin.height;

            Grid {
                width: parent.width;
                height: parent.height + anchors.topMargin;
                id: cartoonEntryGrid;

                anchors.top: parent.top;
                anchors.topMargin: 20;
                anchors.left: parent.left;
                anchors.leftMargin: ;
                anchors.rightMargin: anchors.leftMargin;
                columns: 4;
//                // 间隔：网格Grid的宽度减去 1. 所有ImageText控件的宽度 2. 左右留白 , 最后除以 间隔的数量(columns - 1)得到了间隔大小
//                spacing: (width - columns * imageText.myWidth - anchors.leftMargin - anchors.rightMargin) / (columns - 1);

                spacing: 33;

                ImageText {
                    id: imageText;
                    myImageURL: "http://b-ssl.duitang.com/uploads/item/201902/20/20190220111024_ahtol.thumb.400_0.gif";
                    myText: "调皮";
                }
                ImageText {
                    myImageURL: "http://c-ssl.duitang.com/uploads/item/201911/13/20191113184935_jdoyv.thumb.1000_0.gif";
                    myText: "月半";
                }
                ImageText {
                    myImageURL: "https://pic4.zhimg.com/v2-b13dfdf82a7bdad5b2ec773264038143_b.webp";
                    myText: "冲";
                }
                ImageText {
                    myImageURL: "https://pic3.zhimg.com/v2-a86bdcfa58c6392464f8a24d82e8a326_b.webp";
                    myText: "乖乖坐";
                }
                ImageText {
                    myImageURL: "http://image.biaobaiju.com/uploads/20181003/18/1538563067-OeJQzdWlNG.gif";
                    myText: "绅士";
                }
                ImageText {
                    myImageURL: "http://b-ssl.duitang.com/uploads/item/201902/20/20190220104618_dbfqz.thumb.700_0.gif";
                    myText: "抱抱";
                }
                ImageText {
                    myImageURL: "http://c-ssl.duitang.com/uploads/item/201902/20/20190220111023_vgugt.gif";
                    myText: "无情鞭笞";
                }
                ImageText {
                    myImageURL: "http://ok.166.net/reunionpub/ds/kol/20210417/161624-d31mrlqpj2.gif";
                    myText: "敬礼";
                }
                ImageText {
                    myImageURL: "https://pic2.zhimg.com/v2-146cd9da41b813cd8cd346f1c7f36765_b.webp";
                    myText: "扭PG";
                }
                ImageText {
                    myImageURL: "https://pic1.zhimg.com/v2-76b3c5d4ec9649aecec4b6ec3d0bd7e4_b.webp";
                    myText: "啧啧啧";
                }
                ImageText {
                    myImageURL: "https://pic3.zhimg.com/v2-e1e19e6226b898002682c49d6e103bf2_b.webp";
                    myText: "螺旋升天";
                }
                ImageText {
                    myImageURL: "https://pic4.zhimg.com/v2-608919145d303fc53d78f764f1668a93_b.webp";
                    myText: "我吸";
                }

                ImageText {
                    myImageURL: "http://image.biaobaiju.com/uploads/20181003/18/1538563067-OeJQzdWlNG.gif";
                    myText: "绅士";
                }
                ImageText {
                    myImageURL: "http://b-ssl.duitang.com/uploads/item/201902/20/20190220104618_dbfqz.thumb.700_0.gif";
                    myText: "抱抱";
                }
                ImageText {
                    myImageURL: "http://c-ssl.duitang.com/uploads/item/201902/20/20190220111023_vgugt.gif";
                    myText: "无情鞭笞";
                }
                ImageText {
                    myImageURL: "http://ok.166.net/reunionpub/ds/kol/20210417/161624-d31mrlqpj2.gif";
                    myText: "敬礼";
                }
                ImageText {
                    myImageURL: "https://pic2.zhimg.com/v2-146cd9da41b813cd8cd346f1c7f36765_b.webp";
                    myText: "扭PG";
                }
                ImageText {
                    myImageURL: "https://pic1.zhimg.com/v2-76b3c5d4ec9649aecec4b6ec3d0bd7e4_b.webp";
                    myText: "啧啧啧";
                }
            }
        }
    }
}
