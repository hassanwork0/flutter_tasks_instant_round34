
String getPrivacy(String privacy) {
  switch (privacy){
    case '0':
    return "Public";
    case '1':
    return "Unlisted";
    case '2':
    return "Private";
    default:
    return "Public";
    
  
  }
}