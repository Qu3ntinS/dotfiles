import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "omarchy.workspaces"

  readonly property var qsWindow: root.QsWindow ? root.QsWindow.window : null
  readonly property var qsScreen: qsWindow && qsWindow.screen ? qsWindow.screen : null
  readonly property string screenName: qsScreen ? String(qsScreen.name || "") : ""

  function workspaceMonitorName(ws) {
    if (!ws)
      return ""

    var mon = ws.monitor
    if (mon) {
      if (typeof mon === "string")
        return String(mon)
      if (mon.name)
        return String(mon.name)
    }

    var ipc = ws.lastIpcObject
    if (ipc) {
      if (ipc.monitor)
        return String(ipc.monitor)
      if (ipc.monitorName)
        return String(ipc.monitorName)
    }

    return ""
  }

  function rangeForScreen(name) {
    var monitors = Hyprland.monitors.values
    var list = []
    for (var i = 0; i < monitors.length; i++)
      list.push(monitors[i])

    list.sort(function(a, b) { return a.id - b.id })

    for (var j = 0; j < list.length; j++) {
      if (String(list[j].name || "") === name) {
        var start = j * 10 + 1
        var ids = []
        for (var k = 0; k < 10; k++)
          ids.push(start + k)
        return ids
      }
    }

    return []
  }

  function localIndex(id) {
    var n = ((id - 1) % 10) + 1
    return n < 1 ? id : n
  }

  function workspaceById(id) {
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      if (values[i].id === id)
        return values[i]
    }

    return null
  }

  readonly property var workspaceIdList: {
    var values = Hyprland.workspaces.values
    var monitors = Hyprland.monitors.values
    var screen = root.screenName
    var ids = []

    if (screen) {
      for (var i = 0; i < values.length; i++) {
        var ws = values[i]
        if (!ws || ws.id <= 0)
          continue
        if (workspaceMonitorName(ws) === screen)
          ids.push(ws.id)
      }
    }

    if (ids.length === 0 && screen)
      ids = rangeForScreen(screen)

    ids.sort(function(left, right) { return left - right })
    return ids
  }

  function focusWorkspace(id) {
    if (!root.bar)
      return
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : Math.max(root.workspaceIdList.length, 1)
    columnSpacing: root.vertical ? 0 : Style.space(1)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIdList

      WidgetButton {
        required property int modelData

        readonly property var workspace: root.workspaceById(modelData)
        readonly property bool occupied: workspace !== null && workspace.toplevels && workspace.toplevels.values.length > 0
        readonly property int localId: root.localIndex(modelData)
        readonly property bool focused: {
          var monitors = Hyprland.monitors.values
          var screen = root.screenName
          for (var i = 0; i < monitors.length; i++) {
            var mon = monitors[i]
            if (screen && String(mon.name || "") !== screen)
              continue
            if (mon.activeWorkspace && mon.activeWorkspace.id === modelData)
              return true
          }
          return Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === modelData
        }

        bar: root.bar
        text: focused ? "\uDB85\uDCFB" : (localId === 10 ? "0" : String(localId))
        opacity: occupied || focused ? 1 : 0.5
        horizontalMargin: 6
        verticalPadding: 6
        fixedWidth: root.vertical ? root.barSize : Style.space(20)
        fixedHeight: root.barSize
        onPressed: function() { root.focusWorkspace(modelData) }
      }
    }
  }
}
