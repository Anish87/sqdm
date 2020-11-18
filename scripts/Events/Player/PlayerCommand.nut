SqCore.On().PlayerCommand.Connect(this, function(player, command){
    local cmd = "";
    if(command.len() > 0) cmd = split(command.tostring(), " ")[0];
    switch(cmd)
    {
        case "register":
        case "login":
        case "autologin":
        return AccountCommands(player, command);

        case "stats":
        return GeneralCommands(player, command);
        
        default:
        player.Msg(Color.Light, "Unknown command, go through /cmds for a list of commands.");
        break;
    }
});