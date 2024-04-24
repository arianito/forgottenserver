--   I don't know if this piece of code is going to achieve anything at all, but commenting it is probably the best!



-- local function releaseStorage(player)
--     player:setStorageValue(1000, -1)
-- end

function onLogout(player)
    -- do not add events that make changes to the player on logout, once logged out, there is no instance of the player anymore

    -- if player:getStorageValue(1000) == 1 then
    --     addEvent(releaseStorage, 1000, player)
    -- end

    -- player's type is userdata, we cannot pass it as event argument, only numbers, booleans and tables are allowed
    -- instead we could have passed the player ID, but thats unecessary
    -- this event is going to get triggerd when the player is long gone

    -- clearing the storage after user gotten logged out?
    -- well to be honest, i read the source code and found the Player object is implemented in C++
    -- The storage object is a std::map and is defined in the Player class
    -- and since it is not a pointer, its lifespan is dependant to the player Object
    -- and when user do logout, the player object will be destroyed and so the storage map

    -- use account storage if you are willing to persist the value in the database
    -- game:getAccountStorageValue(accountId, keyId)
    -- game:setAccountStorageValue(accountId, keyId, value)



    return true
end
