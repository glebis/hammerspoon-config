require 'hyper'

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 0
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)


-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
--   hs.reload()
-- end)
-- hs.alert.show("Config loaded")


hs.hotkey.bind({'cmd', 'alt', 'shift', 'ctrl'}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")


-- apps

hs.hotkey.bind({'cmd', 'alt', 'shift', 'ctrl'}, 'T', function () hs.application.launchOrFocus("iterm") end)

hs.hotkey.bind({'cmd', 'alt', 'shift', 'ctrl'}, 'C', function () hs.application.launchOrFocus("Google Chrome") end)

hs.hotkey.bind({'cmd', 'alt', 'shift', 'ctrl'}, 'S', function () hs.application.launchOrFocus("Sublime Text") end)

hs.hotkey.bind({'cmd', 'alt', 'shift', 'ctrl'}, 'U', function () hs.application.launchOrFocus("Ulysses") end)



wifiWatcher = nil
homeSSID = "Antifragile"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()



-- caffeine = hs.menubar.new()
-- function setCaffeineDisplay(state)
--     if state then
--         caffeine:setTitle("AWAKE")
--         hs.alert.show("WAKING YOU UP")
--     else
--         caffeine:setTitle("SLEEPY")
--         hs.alert.show("GOING TO SLEEP")
--     end
-- end

-- function caffeineClicked()
--     setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end

-- if caffeine then
--     caffeine:setClickCallback(caffeineClicked)
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
-- end