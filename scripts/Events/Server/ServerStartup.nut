SqCore.On().ServerStartup.Connect(this, function(){
    // S E R V E R - S E T T I N G S
    SqServer.SetServerName("Sample SqMod Server");
    SqServer.SetPassword("a");
    SqServer.SetGameModeText("v1.1 (SqMod)");
    SqServer.SetMaxPlayers(100);
    // S E R V E R - O P T I O N S
    SqServer.SetOption(SqServerOption.TaxiBoostJump, true);
	SqServer.SetOption(SqServerOption.FastSwitch, true);
	SqServer.SetOption(SqServerOption.JoinMessages, false);
	SqServer.SetOption(SqServerOption.DeathMessages, true);
	SqServer.SetOption(SqServerOption.UseClasses, true);
	SqServer.SetOption(SqServerOption.WallGlitch, true);
	SqServer.SetOption(SqServerOption.DisableBackfaceCulling, true);
	SqServer.SetOption(SqServerOption.StuntBike, false);	
	SqServer.SetOption(SqServerOption.FriendlyFire, true);
	// A D D C L A S S
	SqServer.AddPlayerClass(1, Color3(255,0,0), 121, Vector3(-378.284, -535.627, 17.2826), 1, 33, 999, 27, 999, 19, 999);
	SqServer.AddPlayerClass(2, Color3(0,255,0), 102, Vector3(-378.284, -535.627, 17.2826), 1, 33, 999, 26, 999, 21, 999);
});