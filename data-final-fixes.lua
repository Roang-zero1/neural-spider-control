-- Brighter disconnect button style (vanilla slot_sized_button_red is quite dark).
local styles = data.raw["gui-style"]["default"]
local base_red = styles["slot_sized_button_red"]

local function with_tint(graphical_set, tint)
    if not graphical_set then
        return nil
    end
    local copy = util.table.deepcopy(graphical_set)
    if copy.base then
        copy.base.tint = tint
    end
    if copy.shadow then
        copy.shadow.tint = tint
    end
    if copy.glow then
        copy.glow.tint = tint
    end
    return copy
end

-- Closer to shortcut/tool reds: vivid but still clearly "disconnect".
local default_red = {r = 1, g = 0.45, b = 0.45, a = 1}
local hovered_red = {r = 1, g = 0.58, b = 0.58, a = 1}
local clicked_red = {r = 0.92, g = 0.35, b = 0.35, a = 1}

styles["nsc_neural_disconnect_button"] = {
    type = "button_style",
    parent = "slot_sized_button_red",
    default_graphical_set = with_tint(base_red.default_graphical_set, default_red),
    hovered_graphical_set = with_tint(base_red.hovered_graphical_set, hovered_red),
    clicked_graphical_set = with_tint(base_red.clicked_graphical_set, clicked_red),
    selected_graphical_set = with_tint(base_red.selected_graphical_set, default_red),
    selected_hovered_graphical_set = with_tint(base_red.selected_hovered_graphical_set, hovered_red),
    selected_clicked_graphical_set = with_tint(base_red.selected_clicked_graphical_set, clicked_red),
    disabled_graphical_set = with_tint(base_red.disabled_graphical_set, {r = 0.55, g = 0.55, b = 0.55, a = 1})
}
