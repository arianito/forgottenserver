function RemoveMemberFromPlayerParty(playerId, memberName)
    -- variables must be local
    local player = Player(playerId)
    if not player then
        error('invalid player')
    end

    local party = player:getParty()

    -- itterate over members
    for _, partyMember in ipairs(party:getMembers()) do
        -- if partyMember name matches the provided name
        if partyMember.name == memberName then
            -- remove it from party
            party:removeMember(partyMember)
            -- redundant, no need!   ---  party:removeMember(Player(membername))
            return true
        end
    end
    return false
end
