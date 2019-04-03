function changeDatabase(selection) {
             
    document.getElementById("tableSelector").style.visibility = "visible";
    
    switch(selection) {
    
        case "project":
            //something
            break;
                        
        default:
            document.getElementById("dbInfo").innerHTML = "";
            
    }
                
}

function changeTable(selection) {
    
    //for project tables
    switch(selection) {
            
        case "student":
            //something
            break;
        
        case "payments":
            //something
            break;
            
        default:
            //something
            
    }
    
}