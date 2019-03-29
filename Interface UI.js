function changeDB(selection) {
                
    document.getElementById("text").innerHTML = selection;
    switch(selection) {
    
        case "a1":
            document.getElementById("dbInfo").innerHTML = "abraham";
            break;
                        
        case "a2":
            document.getElementById("dbInfo").innerHTML = "no";
            break;
                        
        case "a3":
            document.getElementById("dbInfo").innerHTML = "hehe";
            break;
                        
        default:
            document.getElementById("dbInfo").innerHTML = "";
            
    }
                
}