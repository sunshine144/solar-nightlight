import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: root
  property var manifest: null
  property var shell: null

  Process {
    id: daemonProc
    command: ["python3", Quickshell.env("HOME") + "/.config/omarchy/plugins/sunshine144.solar-nightlight/bin/solar-nightlight"]
    running: true

    onExited: function(exitCode) {
      restartTimer.restart()
    }
  }

  Timer {
    id: restartTimer
    interval: 5000
    repeat: false
    onTriggered: {
      if (!daemonProc.running) {
        daemonProc.running = true
      }
    }
  }
}
