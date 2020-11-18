sessions <- {};

class AnDiscord
{
	channels = null;
	session = null;
	
	function constructor()
	{
		channels = { "echo" : "channelID" };
		session = SqDiscord.Session();
		
		session.Bind(SqDiscordEvent.Ready, this, onReady);
    	session.Bind(SqDiscordEvent.Message, this, onMessage);
		session.Bind(SqDiscordEvent.Error, this, onError);
		session.Bind(SqDiscordEvent.Disconnect, this, onDisconnect);
		session.Bind(SqDiscordEvent.Quit, this, onQuit);
		
		session.InternalCacheEnabled = true;
	}
	
	function Connect(token)
	{
		session.Connect(token);
	}
	
	function sendMessage(channelID, message)
	{
		session.Message(channelID, message);
	}
	
	function sendEmbed(channelID, embed)
	{
		session.MessageEmbed(channelID, "", embed);
	}
	
	function onReady() 
	{
		SqLog.Inf("Discord bot connection established successfully.");
		session.SetActivity("SqMod Discord Plugin");
	}
	
	function onMessage(message) 
	{
		local member = message.Member, serverID = message.ServerID, authorID = message.Author.ID, content = message.Content;
		local username;
		if(member.Nick != null && member.Nick != "") username = member.Nick;
		else username = message.Author.Username;
		if(serverID != null)
		{
			if(authorID == null || message.Author.IsBot || authorID == "botUserID") return;
			else
			{
				local role, level;
				if(member.Roles.find("roleID") != null) { role  = "Dev"; level = 4; }
				if(message.ChannelID == channels["echo"])
				{
					if(content.len() > 0 && content.slice(0, 1) == "!")
					{
						local command = GetTok(content, " ", 1).slice(1), text = GetTok(content, " ", 2, split(content, " ").len()), embed = SqDiscord.Embed.Embed();
						switch(command)
						{
							case "players":
							{
								sendMessage(channels["echo"], "This is just a test command.");
								break;
							}
							default:
							{
								sendMessage(channels["echo"], "Unknown command.");
								break;
							}
						}
					}
					else
					{
						sendMessage(channels["echo"], role+" "+username+": "+content+"");
						if(level == 4) ::SqBroadcast.Msg("RoyalBlue", "[Discord][#FF5252] "+role+" "+username+"[$FF][#FFFFFF]: "+content+"[$FF]");
						else ::SqBroadcast.Msg("RoyalBlue", "[Discord][#FF5252] "+username+"[$FF][#FFFFFF]: "+content+"[$FF]");;
					}
				}
			}
		}
	}
	
	function onError(code, message) 
	{
		SqLog.Err("%d - %s", code, message);
	}
	
	function onDisconnect() 
	{
		SqLog.Inf("Discord session has disconnected.");
	}
	
	function onQuit() 
	{
		SqLog.Inf("Discord session has quit.");
	}
}

anDiscord <- AnDiscord();
anDiscord.Connect("bot token");

/* Use this function anywhere in the scripts to echo message to whatever Discord echo channel you specify. */
function EchoMessage(message)
{
	if (sessions.rawin(0))
	{
		sessions.rawget(0).sendMessage(sessions.rawget(0).channels["echo"], message);
	}
}

function GetTok(string, separator, n, ...)
{
    local m = vargv.len() > 0 ? vargv[0] : n,
    tokenized = split(string, separator),
    text = "";
    if (n > tokenized.len() || n < 1) return null;
    for (; n <= m; n++)
    {
        text += text == "" ? tokenized[n-1] : separator + tokenized[n-1];
    }
    return text;
}

function NumTok(string, separator)
{
    local tokenized = split(string, separator);
    return tokenized.len();
}