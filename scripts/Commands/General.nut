function GeneralCommands(player, command)
{
    local cmd = "";
    if(command.len() > 0) cmd = split(command.tostring(), " ")[0];
    local splitCmd = split(command, " ");
    switch(cmd)
    {
        case "stats":
        {
            if(splitCmd.len() == 2)
            {
                local plr = SqFind.Player.NameMatches(false, false, splitCmd[1]);
                if(plr)
                {
                    if(plr.Data.Registered)
                    {
                        player.Msg("#DCDCDC", "Kills: [#FFFFFF]"+plr.Data.Kills+"[$FF] | Deaths: [#FFFFFF]"+plr.Data.Deaths+"[$FF] | Ratio: [#FFFFFF]"+(plr.Data.Kills.tofloat()/plr.Data.Deaths.tofloat()).tofloat()+"[$FF]");
                    }
                    else player.Msg(Color.Error, "The target player is not registered.");
                }
                else player.Msg(Color.Error, "The target player in invalid.");
            }
            else player.Msg("#DCDCDC", "Kills: [#FFFFFF]"+player.Data.Kills+"[$FF] | Deaths: [#FFFFFF]"+player.Data.Deaths+"[$FF] | Ratio: [#FFFFFF]"+(player.Data.Kills.tofloat()/player.Data.Deaths.tofloat()).tofloat()+"[$FF]\nCash: ["+Color.Success+"]$"+player.Money.tointeger()+"[$FF] | Bank: ["+Color.Success+"]$"+player.Data.Bank.tointeger()+"[$FF]");
            break;
        }
    }
}