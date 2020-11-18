SqCore.On().PlayerKilled.Connect(this, function(victim, killer, reason, bodypart, isteamkill){
    killer.Data.Kills++;
    victim.Data.Deaths++;
});