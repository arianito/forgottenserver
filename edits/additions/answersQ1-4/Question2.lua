function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members

    -- first thing to do is to fix the query, members table has a many to one relation with guilds table
    -- so we need to join and count its memebers, then check if the memberCount is less that or not
    local selectGuildQuery = [[SELECT g.name as name FROM guilds g
JOIN guild_membership m on g.id = m.guild_id
GROUP by g.id having COUNT(g.id) < %d]]

    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    -- check if we got the result
    if resultId ~= false then
        -- itterate over the query result
        repeat
            local guildName = result.getString(resultId, 'name')
            print(guildName)
            -- repeat until cursor reached the end of result
        until not result.next(resultId)
        -- free the result
        result.free(resultId)
    end
end
