
public protocol DownloadMostEmailedInteractor {
    func execute(params: String, completion: @escaping(Articles) -> Void)
}

public class DownloadMostEmailedInteractorImpl: DownloadMostEmailedInteractor {
    
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


