function update(elapsed)
    local currentBeat = (songPos / 1000)*(bpm/90)
        if curStep > 256 and curStep < 640 then
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
                setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
            end
        end
        if curStep > 641 and curStep < 1024 then
            for i=0,3 do
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi) + 0, i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
            for i=4,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi) + 0, i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
        end
        if curStep > 1282 and curstep < 1411 then
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*5) * math.pi) + 10 ,i)
            end
        end
        if curStep > 1411 then
                setActorX(_G['defaultStrum'..i..'X'])
        end
        if curStep > 1024 and curStep < 1282 then
                setActorX(_G['defaultStrum'..i..'X'])
        end
    end
function stepHit (step)
    if curStep == 640 or curStep == 1025 or curStep == 1282 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
            tweenPosYAngle(i, _G['defaultStrum'..i..'Y'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
    end
end