function AccountCommands(player, command)
{
    local cmd = "";
    if(command.len() > 0) cmd = split(command.tostring(), " ")[0];
    local splitCmd = split(command, " ");
    switch(cmd)
    {
        case "register":
        {
            if(splitCmd.len() == 2)
            {
                local password = splitCmd[1];
                if(!player.Data.Registered)
                {
                    if(password.len() > 6)
                    {
                        player.Data.Register(password);
                    }
                    else player.Msg(Color.Error, "Please use a password of more than 6 characters.");
                }
                else player.Msg(Color.Error, "You are already registered.");
            }
            else player.Msg(Color.Error, "Syntax: [#FFFFFF]/register <password>");
            break;
        }
        case "login":
        {
            if(splitCmd.len() == 2)
            {
                local password = splitCmd[1];
                if(player.Data.Registered)
                {
                    if(!player.Data.loggedIn)
                    {
                        if(password.len() > 0)
                        {
                            player.Data.Login(password);
                        }
                        else player.Msg(Color.Error, "Please enter a valid password.");
                    }
                    else player.Msg(Color.Error, "You are already logged in.");
                }
                else player.Msg(Color.Error, "You need to be registered to use this command.");
            }
            else player.Msg(Color.Error, "Syntax: [#FFFFFF]/login <password>");
            break;
        }

        case "autologin":
        {
            if(splitCmd.len() == 2)
            {
                local text = splitCmd[1];
                if(player.Data.loggedIn)
                {
                    switch(text)
                    {
                        case "on":
                        {
                            if(player.Data.autoLogin != 0)
                            {
                                SqDM.Execute(format("UPDATE accounts SET AutoLogin='%d' WHERE Name='%s'", 0, player.Name));
                                player.Data.autoLogin = 0;
                                player.Msg(Color.LimeGreen, "Your autologin is now [#FFFFFF]activated[$FF]!");
                            }
                            else player.Msg(Color.Error, "Your autologin is already active.");
                            break;
                        }
                        case "off":
                        {
                            if(player.Data.autoLogin != 1)
                            {
                                SqDM.Execute(format("UPDATE accounts SET AutoLogin='%d' WHERE Name='%s'", 1, player.Name));
                                player.Data.autoLogin = 1;
                                player.Msg(Color.LimeGreen, "Your autologin is now [#FFFFFF]deactivated[$FF]!");
                            }
                            else player.Msg(Color.Error, "Your autologin is already inactive.");
                            break;
                        }
                        default:
                        return player.Msg(Color.Error, "Syntax: [#FFFFFF]/autologin <on/off>[$FF]");
                    }
                }
                else player.Msg(Color.Error, "You need to be logged in to use this command.");
            }
            else player.Msg(Color.Error, "Syntax: [#FFFFFF]/autologin <on/off>[$FF]");
            break;
        }
    }
}