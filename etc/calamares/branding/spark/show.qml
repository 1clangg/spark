import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    Slide {
        anchors.fill: parent
        Image {
            anchors.fill: parent
            source: "slide1.png"
            fillMode: Image.PreserveAspectCrop
        }
    }

    Timer {
        interval: 4000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
}
