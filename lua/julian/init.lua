local M = {}

local JULIAN_EPOCH = 2440587.5

local function from_julian_to_epoch(julian_date)
    local julian_day = tonumber(julian_date) - JULIAN_EPOCH
    return math.floor((julian_day * 86400000) + 0.5)
end

local function from_epoch_to_julian(epoch_time)
    local julian_day = (tonumber(epoch_time) / 86400000) + JULIAN_EPOCH
    return julian_day
end

function M.setup(opts)
    opts = opts or {}

    vim.keymap.set("n", "<leader>jdf", function()
        local julian_date = vim.fn.input("Enter Julian date: ")
        return M.julian_to_epoch(julian_date)
    end)
    vim.keymap.set("n", "<leader>jdt", function()
        local epoch_time = vim.fn.input("Enter epoch time: ")
        return M.epoch_to_julian(epoch_time)
    end)
end

--- Convert a Julian date to an epoch timestamp (milliseconds)
---@param julian_date number: The Julian date
---@return number?: The epoch timestamp in milliseconds (or nil on error)
function M.julian_to_epoch(julian_date)
    if tonumber(julian_date) == nil then
        error("julian_date must be a number")
        return
    end
    print(
        "Julian: " ..
        julian_date ..
        " -> Epoch: " ..
        from_julian_to_epoch(julian_date))
end

--- Convert an epoch timestamp (milliseconds) to a Julian date
---@param epoch_time number: The epoch timestamp in milliseconds
---@return number?: The Julian date (or nil on error)
function M.epoch_to_julian(epoch_time)
    if tonumber(epoch_time) == nil then
        error("epoch_time be a number")
        return
    end
    print(
        "Epoch: " ..
        epoch_time ..
        " -> Julian: " ..
        from_epoch_to_julian(epoch_time))
end

return M
