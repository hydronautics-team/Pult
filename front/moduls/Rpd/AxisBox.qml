import QtQuick 2.0

Item {
    id: main1
    width: 30
    height: 35
    property double valueNumber: 0 //входное значение

    property double heightAxis: 150
    property double amountNumber: 6
    property double numberAxix: 0
    property double _x: 0
    property double _y: (parent.height/2)-(heightAxis/amountNumber)*numberAxix-(valueNumber-Math.trunc(valueNumber))*(heightAxis/amountNumber) //формула сдвига рисок

    x:_x-width/2
    y:_y-height/2 // положение Item

    property string text: Math.trunc(valueNumber-numberAxix).toString()
    property double stepSize:0
    property int amount: 0




    property double value_y:Math.abs(_y-parent.height/2)/(heightAxis/2)
    opacity: { // изменение прозрачности риски от значения входного значения
        if(value_y < 1)
            return 1+Math.cos(value_y*Math.PI);
        else
            return 0;
    }

    Rectangle{ // риска
        id: obj1
        width: 20
        height: 2

        anchors.verticalCenter: parent.verticalCenter
        color: "BLACK"
        antialiasing : true
    }
    Item{
        width: 23
        height: 30
        anchors.right: obj1.left
        anchors.rightMargin: 8
        Text { // текст риски
            id: obj2
            text: main1.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}
