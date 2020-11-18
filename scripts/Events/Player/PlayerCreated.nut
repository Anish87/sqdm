SqCore.On().PlayerCreated.Connect(this, function(player, header, payload){
    player.Data = AnPlayer(player);
    player.Data.Load();
});