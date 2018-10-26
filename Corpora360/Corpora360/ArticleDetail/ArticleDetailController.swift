
import UIKit
import WebKit

protocol ArticleDetailView {
    
}

class ArticleDetailViewController: UIViewController, ArticleDetailView, StoryboardViewController, WKNavigationDelegate {
     static var storyboardName: String = "ArticleDetailView"
    
    @IBOutlet weak var webView: WKWebView!
    
    var presenter: ArticleDetailPresenter?
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let article = article else { return }
        self.navigationItem.title = article.title
        let url = URL(string: article.url)
        webView.load(URLRequest(url: url!))
        
    }
}
