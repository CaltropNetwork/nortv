#include <sourcemod>

public Plugin myinfo =
{
	name = "NoRTV",
	author = "Asterisk",
<<<<<<< HEAD
	description = "Tells people trying to use RTV and nominate that those are disabled.",
=======
	description = "Informs players trying to use RTV or nominate that it is disabled and randomchooser is used instead.",
>>>>>>> 680b2942aefd946addc53475026c4b5def4dfcad
	version = "1.0.0",
	url = "https://github.com/caltropnetwork/nortv"
};

public void OnPluginStart()
{
    // Hook the chat event
    HookEvent("player_say", OnPlayerSay);
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

    return Plugin_Continue;
}
