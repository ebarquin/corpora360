
import Foundation

public class Article {
    var title: String
    var author: String
    var section: String
    var date: String
    var url: String
    var image: String
    
    init(title: String, author: String, section: String, date: String, url: String, image: String) {
        self.title = title
        self.author = author
        self.section = section
        self.date = date
        self.url = url
        self.image = image
    }
}
