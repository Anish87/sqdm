SqCore.On().PlayerRequestClass.Connect(this, function(player, ...) {
    local skin = player.Skin;
    switch(skin)
    {
        case 121:
        player.AnnounceEx(0, "SKIN 121");
        break;
        
        case 102:
        player.AnnounceEx(0, "SKIN 102");
        break;

        default:
        return;
    }
});