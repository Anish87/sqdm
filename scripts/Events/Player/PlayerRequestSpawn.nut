SqCore.On().PlayerRequestSpawn.Connect(this, function(player){
    if(!player.Data.Registered){
        player.Msg(Color.Error, "Please register to spawn.");
        SqCore.SetState(0);
        return;
    }
    if(!player.Data.loggedIn){
        player.Msg(Color.Error, "Please login to spawn.");
        SqCore.SetState(0);
        return;
    }
});