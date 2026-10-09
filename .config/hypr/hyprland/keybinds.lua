hl.define_submap("global", function()
    hl.bind("SUPER+Return", hl.dsp.exec_cmd("alacritty"))

    hl.bind("ALT+1", hl.dsp.focus({ workspace = 1 }))
    hl.bind("ALT+2", hl.dsp.focus({ workspace = 2 }))
    hl.bind("ALT+3", hl.dsp.focus({ workspace = 3 }))
    hl.bind("ALT+4", hl.dsp.focus({ workspace = 4 }))
    hl.bind("ALT+5", hl.dsp.focus({ workspace = 5 }))
    hl.bind("ALT+6", hl.dsp.focus({ workspace = 6 }))
    hl.bind("ALT+7", hl.dsp.focus({ workspace = 7 }))
    hl.bind("ALT+8", hl.dsp.focus({ workspace = 8 }))
    hl.bind("ALT+9", hl.dsp.focus({ workspace = 9 }))
    hl.bind("ALT+0", hl.dsp.focus({ workspace = 10 }))

    hl.bind("ALT+SHIFT+1", hl.dsp.window.move({ workspace = 1 }))
    hl.bind("ALT+SHIFT+2", hl.dsp.window.move({ workspace = 2 }))
    hl.bind("ALT+SHIFT+3", hl.dsp.window.move({ workspace = 3 }))
    hl.bind("ALT+SHIFT+4", hl.dsp.window.move({ workspace = 4 }))
    hl.bind("ALT+SHIFT+5", hl.dsp.window.move({ workspace = 5 }))
    hl.bind("ALT+SHIFT+6", hl.dsp.window.move({ workspace = 6 }))
    hl.bind("ALT+SHIFT+7", hl.dsp.window.move({ workspace = 7 }))
    hl.bind("ALT+SHIFT+8", hl.dsp.window.move({ workspace = 8 }))
    hl.bind("ALT+SHIFT+9", hl.dsp.window.move({ workspace = 9 }))
    hl.bind("ALT+SHIFT+0", hl.dsp.window.move({ workspace = 10 }))

    hl.bind("ALT+Tab", hl.dsp.focus({ workspace = "previous" }))

    hl.bind("SUPER+h", hl.dsp.focus({ direction = "l" }))
    hl.bind("SUPER+l", hl.dsp.focus({ direction = "r" }))
    hl.bind("SUPER+k", hl.dsp.focus({ direction = "u" }))
    hl.bind("SUPER+j", hl.dsp.focus({ direction = "d" }))

    hl.bind("SUPER+SHIFT+h", hl.dsp.window.swap({ direction = "l" }))
    hl.bind("SUPER+SHIFT+l", hl.dsp.window.swap({ direction = "r" }))
    hl.bind("SUPER+SHIFT+k", hl.dsp.window.swap({ direction = "u" }))
    hl.bind("SUPER+SHIFT+j", hl.dsp.window.swap({ direction = "d" }))

    hl.bind("SUPER+f", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
    hl.bind("SUPER+m", hl.dsp.window.fullscreen({ mode = "maximized" }))

    hl.bind("SUPER+q", hl.dsp.window.close())

    hl.bind("SUPER+space", hl.dsp.window.float())

    hl.bind("SUPER+c", hl.dsp.window.center())

    hl.bind("SUPER+p", hl.dsp.exec_cmd("hyprlock"))

    hl.bind("SUPER+Escape", hl.dsp.exit())
end)
