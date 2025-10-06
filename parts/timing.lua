local TIMING={}

-- Logical tick rate (Hz). Defaults to 60; can be overridden by settings.
TIMING.LOGIC_HZ = (SETTING and SETTING.logicHZ) or 60

function TIMING.framesToSeconds(frames)
    return frames / TIMING.LOGIC_HZ
end

function TIMING.secondsToFrames(seconds)
    return seconds * TIMING.LOGIC_HZ
end

function TIMING.secondsToFramesInt(seconds)
    return math.floor(seconds * TIMING.LOGIC_HZ + 0.5)
end

-- Convert a legacy frame count at a given base Hz to current logic frames
-- Example: 26 frames at 60Hz -> equivalent frames at current LOGIC_HZ
function TIMING.fromLegacyFrames(frames, legacyHz)
    legacyHz = legacyHz or 60  -- Default to 60Hz if not specified
    return math.floor(frames * TIMING.LOGIC_HZ / legacyHz + 0.5)
end

-- General frame conversion between two Hz values
function TIMING.framesAt(frames, fromHz, toHz)
    return math.floor(frames * toHz / fromHz + 0.5)
end

-- Apply logic tick rate from loaded settings
function TIMING.applyFromSetting()
    if SETTING and type(SETTING.logicHZ)=='number' then
        TIMING.LOGIC_HZ = SETTING.logicHZ
    end
end

return TIMING