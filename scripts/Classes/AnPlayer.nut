class AnPlayer
{
    instance = null;
    Kills = 0;
    Level = 0;
    Deaths = 0;
    Cash = 0;
    Bank = 0;
    loggedIn = false;
    Registered = false;
    autoLogin = false;

    function constructor(player)
    {
        this.instance = player;
    }

    function Register(password)
    {
        local now = date(), passhash = SqHash.GetSHA256(password), s = format("INSERT INTO accounts(Name, Password, UID, UID2, IP, Level, Cash, Bank, Kills, Deaths, DateRegistered) VALUES('%s', '%s', '%s', '%s', '%s', '%d', '%d', '%d', '%d', '%d', '"+now.day+"-"+now.month+"-"+now.year+"')", this.instance.Name, passhash, this.instance.UID, this.instance.UID2, this.instance.IP, 1, 5000, 0, 0, 0);
        SqDM.Execute(s);
        this.instance.Msg(Color.LimeGreen, "You have successfully registered. Here's your password, don't forget it: [#FFFFFF]"+password+"[$FF].");
        this.Registered     = true;
        this.loggedIn       = true;
        this.Cash           = 5000;
        this.instance.Money = this.Cash;
        this.Bank           = 0;
        this.Kills          = 0;
        this.Deaths         = 0;
        this.Level          = 1;
        print(s);
    }

    function Login(password)
    {
        local db = SqDM.Query(format("SELECT * FROM accounts WHERE Name='%s'", this.instance.Name));
        if(db.Step())
        {
            local dbpass = db.GetString("Password"), hash = SqHash.GetSHA256(password);
            if(dbpass == hash)
            {
                this.loggedIn = true;
                this.instance.Msg(Color.LimeGreen, "You have successfully logged in.");
            }
            else this.instance.Msg(Color.Error, "Inavlid password.");
        }
    }

    function Load()
    {
        local q = SqDM.Query(format("SELECT * FROM accounts WHERE Name='%s'", this.instance.Name));
        if(q.Step())
        {
            this.Kills          = q.GetInteger("Kills");
            this.Deaths         = q.GetInteger("Deaths");
            this.Level          = q.GetInteger("Level");
            this.Cash           = q.GetInteger("Cash");
            this.instance.Money = this.Cash;
            this.Bank           = q.GetInteger("Bank");
            this.Registered     = true;
            this.autoLogin      = q.GetInteger("AutoLogin");
            if(this.instance.UID == q.GetString("UID") && this.instance.IP == q.GetString("IP"))
            {
                if(this.autoLogin == 0)
                {
                    this.instance.Msg(Color.Primary, format("Welcome back to the server, [#FFFFFF]%s[$FF].", this.instance.Name));
                    this.instance.Msg(Color.Primary, "You have been auto-logged in.");
                    this.loggedIn = true;
                }
                else
                {
                    this.instance.Msg(Color.Primary, format("Welcome back to the server, [#FFFFFF]%s[$FF].", this.instance.Name));
                    this.instance.Msg(Color.Info, "You are not logged in, please [#FFFFFF]/login[$FF] to continue.");
                }
            }
            else
            {
                this.instance.Msg(Color.Primary, format("Welcome back to the server, [#FFFFFF]%s[$FF].", this.instance.Name));
                this.instance.Msg(Color.Info, "You are not logged in, please [#FFFFFF]/login[$FF] to continue.");
            }
        }
        else
        {
            this.instance.Msg(Color.Primary, format("Welcome to the server, [#FFFFFF]%s[$FF].", this.instance.Name));
            this.instance.Msg(Color.Info, "You are not registered, please [#FFFFFF]/register[$FF] to continue.");
        }
    }

    function Save()
    {
        if(this.Registered && this.loggedIn)
        {
            local q = format("UPDATE accounts SET Kills='%d', Deaths='%d', Cash='%d', Bank='%d' WHERE Name='%s'", this.Kills, this.Deaths, this.instance.Money, this.Bank, this.instance.Name);
            SqDM.Execute(q);
        }
    }
}