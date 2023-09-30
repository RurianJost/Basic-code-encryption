function encrypt(messageToObfuscate, shift)
    local obfuscatedMessage = ''
    
    for i = 1, #messageToObfuscate do
        local character = messageToObfuscate:sub(i, i)
        
        if character >= 'a' and character <= 'z' then
            character = string.char((character:byte() - 97 + shift) % 26 + 97)
        elseif character >= 'A' and character <= 'Z' then
            character = string.char((character:byte() - 65 + shift) % 26 + 65)
        end

        obfuscatedMessage = obfuscatedMessage..character
    end

    return obfuscatedMessage
end

function decryptBruteForce(messageToDeobfuscate)
    local deobfuscatedMessages = {}

    for shift = 0, 25 do
        local deobfuscatedMessage = ''

        for i = 1, #messageToDeobfuscate do
            local character = messageToDeobfuscate:sub(i, i)

            if character >= 'a' and character <= 'z' then
                character = string.char((character:byte() - 97 - shift) % 26 + 97)
            elseif character >= 'A' and character <= 'Z' then
                character = string.char((character:byte() - 65 - shift) % 26 + 65)
            end

            deobfuscatedMessage = deobfuscatedMessage..character
        end

        table.insert(deobfuscatedMessages, deobfuscatedMessage)
    end

    return deobfuscatedMessages
end