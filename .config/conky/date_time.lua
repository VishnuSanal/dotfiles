---@diagnostic disable: lowercase-global
function conky_getweekday()
    return tostring(os.date("%A")):gsub(".", "%1 "):sub(1, -2)
end

function conky_getdate()
    return tostring(os.date("%d %B, %Y"))
end

function conky_gettime()
    return tostring(os.date("- %H:%M -"))
end
