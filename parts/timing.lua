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

return TIMING