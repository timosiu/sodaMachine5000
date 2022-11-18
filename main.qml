import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 900
    height: 810
    visible: true
    title: qsTr("Soda Machine 5000")

    Rectangle {
        id: backGround
        anchors.fill: parent
        color: "grey"

        Rectangle {
            id: screenArea
            width: 850
            height: 700
            color: "lavender"
            x: 25
            y: 25
            radius: 20

            //States
            state: "neutral"

            states: [
                State {name: "neutral"
                    PropertyChanges {
                        target: fillButton; buttonText: "Fill";
                    }
                },
                State {name: "filling"
                    PropertyChanges {
                        target: fillButton; buttonText: "Filling...";
                    }

                }
            ]


            //Drink Buttons
            SodaButton{
                imgSource: "colaCola.png"
                id: colaBtn
                x: 145; y: 100
                onButtonClicked: { //These are here so the drink can't change while pouring
                    if (theDrink.drinkAmount > 0){
                        theDrink.drinkColor = theDrink.drinkColor
                    }else {
                        theDrink.drinkColor = "black"
                    }
                }
            }

            SodaButton{
                id: dewBtn
                imgSource: "7dew.png"
                x: 290; y: 100
                onButtonClicked: {
                    if (theDrink.drinkAmount > 0){
                        theDrink.drinkColor = theDrink.drinkColor
                    }else {
                        theDrink.drinkColor = "lightgreen"
                    }
                }
            }

            SodaButton{
                id: ojBtn
                imgSource: "orangeJuice.png"
                x: 435; y: 100
                onButtonClicked: {
                    if (theDrink.drinkAmount > 0){
                        theDrink.drinkColor = theDrink.drinkColor
                    }else {
                        theDrink.drinkColor = "orange"
                    }
                }
            }

            SodaButton{
                id: waterBtn
                imgSource: "h2o.png"
                x: 580; y: 100
                onButtonClicked: {
                    if (theDrink.drinkAmount > 0){
                        theDrink.drinkColor = theDrink.drinkColor
                    }else {
                        theDrink.drinkColor = "lightblue"
                    }
                }
            }

            //Fill Button
            Button {
                id: fillButton
                buttonText: "Fill Cup"
                backGroundColor: "grey"
                borderColor: "black"
                anchors.centerIn: parent
                onButtonClicked: {
                    if (parent.state === "neutral"){
                        parent.state = "filling"
                    } else {
                        parent.state = "neutral"
                    }
                }
                onPressAndHold: {
                    //Checking if any drink button is focused. User must choose a drink
                    if (colaBtn.focus || dewBtn.focus || ojBtn.focus || waterBtn.focus){
                        if (theDrink.drinkAmount < 220){
                            theDrink.drinkAmount += 10
                        }
                    }

                }
            }

            Drink {
                id: theDrink
                anchors.bottom: glassBottom.top
                anchors.horizontalCenter: parent.horizontalCenter
                Behavior on drinkAmount {
                    PropertyAnimation{
                        duration: 1000
                    }
                }

            }

            //3 Rectangles to simulate drinkware
            Rectangle{
                id: glassBottom
                width: 300; height: 10
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
            Rectangle {
                height: 250; width: 10
                color: "red"
                anchors.bottom: parent.bottom
                anchors.left: glassBottom.left
            }
            Rectangle {
                height: 250; width: 10
                color: "red"
                anchors.bottom: parent.bottom
                anchors.right: glassBottom.right
            }


            //Testing buttons, Machine logo
            Button {
                id: emptyButton
                buttonText: "Empty cup"
                width: 150
                height: 50

                anchors.bottom: parent.bottom
                onButtonClicked: {
                    theDrink.drinkAmount = 0
                }
            }

            Image {
                id: sodaLogo
                source: "sodaLogo.png"
                anchors.horizontalCenter: parent.horizontalCenter
                y: 700
            }
        }
    }
}
