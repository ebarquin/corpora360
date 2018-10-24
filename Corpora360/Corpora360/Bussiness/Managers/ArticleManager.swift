
import SwiftyJSON
import Alamofire

public protocol ArticleManager {
    func downloadArticles(completion: @escaping(Articles) -> Void)
}

public class ArticleManagerImpl: ArticleManager {
    
    public func downloadArticles(completion: @escaping(Articles) -> Void) {
        Alamofire.request(endpoint, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let articles = self.decode(json: json)
                    completion(articles)
                }
            case .failure:
                print("failure")
            }
        }
    }
    
    func decode(json: JSON) -> Articles {
        let entries = json.arrayValue
        
        var articles = Articles()
        
        for entry in entries {
            let title = entry[""].stringValue
            let author = entry[""].stringValue
            let section = entry[""].stringValue
            let date = entry[""].stringValue
            let url = entry[""].stringValue
            
            let article = Article(title: title, author: author, section: section, date: date, url: url)
            articles.append(article)
        }
        return articles
    }
}
