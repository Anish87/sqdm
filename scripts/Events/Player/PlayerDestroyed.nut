SqCore.On().PlayerDestroyed.Connect(this, function(player, reason, payload){
    switch(reason)
    {
        case SqPartReason.Timeout:
        SqBroadcast.Message(format("[#FFFF87]%s[#FFFFFF] timed out.", player.Name));
        break;
        
        case SqPartReason.Kick:
        SqBroadcast.Message(format("[#FFFF87]%s[#FFFFFF] got kicked.", player.Name));
        break;

        case SqPartReason.Quit:
        SqBroadcast.Message(format("[#FFFF87]%s[#FFFFFF] quit the game.", player.Name));
        break;

        case SqPartReason.Crash:
        SqBroadcast.Message(format("[#FFFF87]%s[#FFFFFF]'s game crashed.", player.Name));
        break;

        case SqPartReason.AntiCheat:
        SqBroadcast.Message(format("[#FFFF87]%s[#FFFFFF] has been kicked for unfair advantages.", player.Name));
        break;
    }
    player.Data.Save();
});