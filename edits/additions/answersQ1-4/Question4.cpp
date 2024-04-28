void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId)
{
    // define the temporary variable on top of the function
    // to expand its lifespan during execution

    Player tmpPlayer(nullptr); // usees stack memory instead of heap
    Player *player = g_game.getPlayerByName(recipient);
    if (!player)
    {
        // defining temporary variable here would reduce the variable's lifespan down to if/else block
        if (!IOLoginData::loadPlayerByName(&tmpPlayer, recipient))
            return;
        // set the player pointer to our newly initialized player variable
        player = &tmpPlayer;
    }


    Item *item = Item::CreateItem(itemId);
    if (!item)
        return;

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline())
        IOLoginData::savePlayer(player);
}