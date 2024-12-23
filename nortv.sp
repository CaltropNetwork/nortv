public void OnPluginStart()
{
    // Perform the plugin check at runtime
    CheckPlugins();

    // Hook the chat event
    HookEvent("player_say", OnPlayerSay);
}

public void CheckPlugins()
{
    bool mapchooserLoaded = false;
    bool rockthevoteLoaded = false;
    bool nominationsLoaded = false;

    // Get the number of loaded plugins
    int pluginCount = GetPluginCount();

    // Loop through all loaded plugins
    for (int i = 0; i < pluginCount; i++)
    {
        // Get the plugin handle
        Plugin plugin = GetPluginByIndex(i);
        char pluginName[64];
        GetPluginInfo(plugin, pluginName, sizeof(pluginName), NULL, NULL);

        // Check for the specific plugins
        if (StrEqual(pluginName, "mapchooser", false) || StrEqual(pluginName, "mapchooser_extended", false))
        {
            mapchooserLoaded = true;
        }
        else if (StrEqual(pluginName, "rockthevote", false) || StrEqual(pluginName, "rockthevote_extended", false))
        {
            rockthevoteLoaded = true;
        }
        else if (StrEqual(pluginName, "nominations", false) || StrEqual(pluginName, "nominations_extended", false))
        {
            nominationsLoaded = true;
        }
    }

    // Check if the required plugins are loaded
    if (mapchooserLoaded || rockthevoteLoaded || nominationsLoaded)
    {
        // Print an error message to the server console
        PrintToServer("Error: Map voting is not disabled.");
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
