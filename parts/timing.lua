local TIMING={}

-- Logical tick rate (Hz). Fixed at 60 for game stability and compatibility.
TIMING.LOGIC_HZ = 120

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

-- Speed calculation helpers (per-minute metrics)
function TIMING.perMinute(count, timeInSeconds)
    return timeInSeconds > 0 and (count / timeInSeconds * 60) or 0
end

-- Common speed metrics
function TIMING.getLPM(lines, timeInSeconds)
    return TIMING.perMinute(lines, timeInSeconds)
end

function TIMING.getAPM(attacks, timeInSeconds)
    return TIMING.perMinute(attacks, timeInSeconds)
end

function TIMING.getPPS(pieces, timeInSeconds)
    return timeInSeconds > 0 and (pieces / timeInSeconds) or 0
end

-- Frame delta for DAS/ARR counting to maintain 60Hz timing at any LOGIC_HZ
TIMING.FRAME_DELTA = 1

-- Pre-calculated constants for performance
TIMING.DROP_SPEED_COEFF = TIMING.fromLegacyFrames(72, 60)

-- Pre-calculated constant for 3 seconds in frames
TIMING.THREE_SECONDS_FRAMES = TIMING.secondsToFramesInt(3)

return TIMING