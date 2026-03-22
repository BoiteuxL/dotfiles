// Bar.qml
import QtQuick
import Quickshell
import Quickshell.Io

import "widgets"

PanelWindow {
    id: bar
    visible: true
    implicitHeight: 24
    anchors { top: true; left: true; right: true }
    margins { top: -24; left: 0; right: 0 }
    color: "transparent"

    required property string time


    PanelWindow {
        implicitHeight: 24

        anchors {
            top: true
            left: true
            right: true
        }

        ClockWidget {

            anchors.: parent
            time: bar.time
        }

    }

    Process {
        id: dateProc

        command: ["date"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: bar.time = this.text
        }

    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }

}
