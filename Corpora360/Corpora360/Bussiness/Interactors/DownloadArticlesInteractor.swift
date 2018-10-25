
public protocol DownloadArticlesInteractor {
    func execute(params: String, completion: @escaping(Articles) -> Void)
}

public class DownloadArticlesInteractorImpl: DownloadArticlesInteractor {
    
    let articleManager: ArticleManagerImpl
    
    public init(articleManager: ArticleManagerImpl) {
        self.articleManager = articleManager
    }
    
    public func execute(params: String, completion: @escaping(Articles) -> Void) {
        articleManager.downloadArticles(params: params) { (articles) in
            completion(articles)
        }
    }
}


