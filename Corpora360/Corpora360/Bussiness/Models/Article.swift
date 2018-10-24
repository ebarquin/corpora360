
import Foundation

public class Article {
    var title: String
    var author: String
    var section: String
    var date: String
    var url: String
    
    init(title: String, author: String, section: String, date: String, url: String) {
        self.title = title
        self.author = author
        self.section = section
        self.date = date
        self.url = url
    }
}
