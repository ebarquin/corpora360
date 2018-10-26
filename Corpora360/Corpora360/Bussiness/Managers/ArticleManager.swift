
import SwiftyJSON
import Alamofire

public protocol ArticleManager {
    func downloadArticles(params: String, completion: @escaping(Articles) -> Void)
}

public class ArticleManagerImpl: ArticleManager {
    
    public func downloadArticles(params: String, completion: @escaping(Articles) -> Void) {
        Alamofire.request("\(ENDPOINT)\(params)",
            method: .get,
            parameters: PARAMETERS).responseJSON { (response) in
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
        let entries = json["results"].arrayValue
        
        var articles = Articles()
        
        for entry in entries {
            let title = entry["title"].stringValue
            let author = entry["byline"].stringValue
            let section = entry["section"].stringValue
            let date = entry["published_date"].stringValue
            let url = entry["url"].stringValue
            let media = entry["media"].arrayValue
            let mediaArray = media[0]["media-metadata"].arrayValue.map({$0["url"].stringValue})
            let image = mediaArray[0]
            let article = Article(title: title, author: author, section: section, date: date, url: url, image: image)
            articles.append(article)
        }
        return articles
    }
}
