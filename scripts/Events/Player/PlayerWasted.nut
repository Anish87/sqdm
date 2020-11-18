SqCore.On().PlayerWasted.Connect(this, function(player, reason){
    player.Data.Deaths++;
});