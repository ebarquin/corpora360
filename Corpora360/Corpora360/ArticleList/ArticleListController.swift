
import UIKit
import Kingfisher

protocol ArticleListView {
    func navigateToArticleDetail(article: Article)
}

class ArticleListViewController: UIViewController, ArticleListView, StoryboardViewController, UITableViewDataSource, UITableViewDelegate {
    static var storyboardName: String = "ArticleListView"
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ArticleListPresenter?
    var articles: Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ArticleListPresenterImpl()
        presenter?.attachView(view: self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = articles  else {
            return 0
        }
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! ArticleListCell
        
        
        let article = articles![indexPath.row]
        self.configureCell(cell, withArticle: article)
        
        return cell
    }
    
    func configureCell(_ cell: ArticleListCell, withArticle: Article) {
        cell.articleAuthorLabel.text = withArticle.author
        cell.articleTitleLabel.text = withArticle.title
        cell.articleSectionLabel.text = withArticle.section
        cell.articleDateLabel.text = withArticle.date
        cell.articleImageView.kf.setImage(with: ImageResource(downloadURL: URL(string: withArticle.image)!), placeholder: UIImage(named: "nyt_logo"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles![indexPath.row]
        
        presenter?.articleItemDidTap(article: article)
    }
    
    func navigateToArticleDetail(article: Article) {
        let articleDetailVC = ArticleDetailViewController.initFromStoryboard()
        articleDetailVC.article = article
        navigationController?.pushViewController(articleDetailVC, animated: true)
    }
}
