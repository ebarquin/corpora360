
import Foundation

class Article {
    var title: String
    var author: String
    var section: String
    var date: Date
    var url: String
    
    init(title: String, author: String, section: String, date: Date, url: String) {
        self.title = title
        self.author = author
        self.section = section
        self.date = date
        self.url = url
    }
}
