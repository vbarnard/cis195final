import UIKit

struct APIdata : Decodable{
    public let data : [Contact]
}

struct Image : Decodable {
    public let url : String
}

// Model for "NewsItem" goes in this file
struct Contact : Decodable {
    
    
    
    //enum Category: String, Decodable {
        //case swift, combine, debugging, xcode
    //}
    
    public let description : String
    public let designation : String
    public let fullName : String
    public let images : [Image]
    
    
    
}
