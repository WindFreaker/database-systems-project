var db = openDatabase('mydb', '1.0', 'Test DB', 2 * 1024 * 1024);
var names;

function consoleTA() {
    
    var command = document.getElementById("consoleInput").value;
    
    db.transaction(function (tx) {
        
        console.log(tx.executeSql(command));
        
    });
    
}

function getNames() {
    
    db.transaction(function (tx) {
        
        tx.executeSql("SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Test = N'Test';");
        console.log("help me god");
        
    });
    
}