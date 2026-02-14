import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  property int barH: 28
  property int pad: 8
  property int gap: 12
  property color glass: "#22000000"
  property color ink: "white"

  PanelWindow {
    id: leftBar
    anchors { top: true; left: true }
    color: glass
    implicitHeight: barH
    width: leftRow.implicitWidth + pad*2

    Row {
      id: leftRow
      anchors.fill: parent
      anchors.margins: pad
      spacing: 14

      Text { text: "Finder"; color: ink; font.bold: true; opacity: 0.95 }
      Repeater {
        model: ["File","Edit","View","Go","Window","Help"]
        delegate: Rectangle {
          radius: 4
          color: hovered ? "#33FFFFFF" : "transparent"
          anchors.verticalCenter: parent.verticalCenter
          height: 20
          width: txt.implicitWidth + 10
          property bool hovered: false
          Text { id: txt; anchors.centerIn: parent; color: ink; text: modelData; opacity: 0.85 }
          MouseArea { anchors.fill: parent; hoverEnabled: true; onEntered: parent.hovered = true; onExited: parent.hovered = false }
        }
      }
    }
  }

  PanelWindow {
    id: rightBar
    anchors { top: true; right: true }
    color: glass
    implicitHeight: barH
    width: rightRow.implicitWidth + pad*2

    Row {
      id: rightRow
      anchors.fill: parent
      anchors.margins: pad
      spacing: gap

      Text { text: "🔊"; color: ink }
      Text { text: "📶"; color: ink }
      Text { text: "🔋"; color: ink }

      Rectangle { width: 1; height: 16; color: "#55FFFFFF"; anchors.verticalCenter: parent.verticalCenter } 

      Text { id: clock; color: ink; font.bold: true; text: clockText }
    }

    property string clockText: ""
    Process {
      id: dateProc
      command: ["bash","-lc","date '+%a %b %d  %I:%M %p'"]
      running: true
      stdout: StdioCollector { onStreamFinished: rightBar.clockText = this.text.trim() }
    }
    Timer { interval: 1000; running: true; repeat: true; onTriggered: dateProc.running = true }
    Connections { target: rightRow; function onImplicitWidthChanged(){ rightBar.width = rightRow.implicitWidth + pad*2 } }
  }
  Connections { target: leftRow; function onImplicitWidthChanged(){ leftBar.width = leftRow.implicitWidth + pad*2 } }

  PanelWindow {
    id: dock
    anchors { left: true; right: true; bottom: true }
    implicitHeight: 64
    color: "transparent"

    Rectangle {
      id: bg
      width: Math.min(parent.width - 80, 720)
      height: 56
      radius: 18
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 10
      color: "#22000000"
      border.color: "#33FFFFFF"
      layer.enabled: true
      layer.smooth: true
      layer.samples: 4
    }

    Row {
      id: dockRow
      spacing: 10
      anchors.centerIn: bg

      Repeater {
        model: 9
        delegate: Rectangle {
          width: 40; height: 40; radius: 10
          color: "#55FFFFFF"
          opacity: hovered ? 0.9 : 0.65
          scale: hovered ? 1.12 : 1.0
          Behavior on scale { NumberAnimation { duration: 110 } }
          Behavior on opacity { NumberAnimation { duration: 110 } }
          MouseArea { anchors.fill: parent; hoverEnabled: true; onEntered: parent.hovered = true; onExited: parent.hovered = false }
          property bool hovered: false
        }
      }
    }
  }
}
