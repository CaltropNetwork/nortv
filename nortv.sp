public void OnPluginStart()
{
    // Perform the plugin check at runtime
    CheckPlugins();

    // Hook the chat event
    HookEvent("player_say", OnPlayerSay);
}

public void CheckPlugins()
{
    // Check that map voting is actually disabled.
    if ((FindPluginByName("mapchooser") != 0 || FindPluginByName("mapchooser_extended") != 0) && 
        (FindPluginByName("rockthevote") != 0 || FindPluginByName("rockthevote_extended") != 0) && 
        (FindPluginByName("nominations") != 0 || FindPluginByName("nominations_extended") != 0))
    {
        // Print an error message to the server console
        PrintToServer("[ERROR] Map voting is not actually disabled. Please disable the mapchooser, rockthevote, and nominations plugins.");
    }
}

public Action OnPlayerSay(Event event, const char[] name, bool dontBroadcast)
{
    // Declare a buffer for the message
    char message[256]; // Adjust the size as needed

    // Get the message from the event
    GetEventString(event, "text", message, sizeof(message));

    // Check for the specific commands
    if (StrEqual(message, "rtv", false) || 
        StrEqual(message, "!rtv", false) || 
        StrEqual(message, "nominate", false) || 
        StrEqual(message, "!nominate", false))
    {
        // Tell those losers who didn't read the MOTD what it says.
        PrintToChatAll("[SM] Map voting is disabled, maps are chosen at random.");
    }

    return Action::Continue;
}
