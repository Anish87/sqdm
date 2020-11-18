SqCore.On().ScriptLoaded.Connect(this, function(){
    SqLog.Dbg("------------------------------------------------");
    SqLog.Usr("Server Name: Sample SqMod Server");
    SqLog.Usr("Developer: Anish(Anish87)");
    SqLog.Usr("Database: MySQL");
    SqLog.Dbg("------------------------------------------------");
    local mysql = MySQL.Account("ip", "username", "password", "db-name"); /* In case you're using localhost for MySQL Database, use 127.0.0.1 as the IP. */
    SqDM <- mysql.Connect();
    /* Don't create tables like using the below statement, prefer making tables manually in MySQL CLI or phpmyadmin. */
    // SqDM.Execute("CREATE TABLE IF NOT EXISTS accounts(ID INTEGER PRIMARY KEY AUTO_INCREMENT, Name TEXT, Password VARCHAR(255), UID VARCHAR(255), UID2 VARCHAR(255), IP VARCHAR(255), Level INTEGER, Cash INTEGER, Bank INTEGER, Kills INTEGER, Deaths INTEGER, DateRegistered VARCHAR(255), AutoLogin INTEGER DEFAULT 0)");
    SqLog.Dbg("Database connection successful.");
});