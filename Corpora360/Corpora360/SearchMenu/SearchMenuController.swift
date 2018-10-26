
import UIKit

protocol SearchMenuView: class {
    func showSpinner()
    func hideSpinner()
    func navigateToArticleList(_ articles: Articles)
    
}

class SearchMenuViewController: UIViewController, SearchMenuView {
    var presenter: SearchMenuPresenter?
    var facebook: Bool = false
    var twitter: Bool = false
    
    @IBOutlet weak var articlesSearchBySegmentedControl: UISegmentedControl!
    @IBOutlet weak var timeSearchSegmentedControl: UISegmentedControl!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var sharedLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchMenuPresenterImpl()
        presenter?.attachView(view: self)
        stack.isHidden = true
        sharedLabel.isHidden = true
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch articlesSearchBySegmentedControl.selectedSegmentIndex {
        case 0:
            stack.isHidden = true
            sharedLabel.isHidden = true
            twitterButton.isSelected = false
            facebookButton.isSelected = false
            twitter = false
            facebook = false
        case 1:
            stack.isHidden = false
            sharedLabel.isHidden = false
        case 2:
            stack.isHidden = true
            sharedLabel.isHidden = true
            twitterButton.isSelected = false
            facebookButton.isSelected = false
            twitter = false
            facebook = false
        default:
            break
        }
    }
    @IBAction func facebookButtonDidTap(_ sender: Any) {
        if facebook {
            facebookButton.isSelected = false
            facebook = false
            
        } else {
            facebookButton.isSelected = true
            facebook = true
        }
    }
    @IBAction func twitterButtonDidTap(_ sender: Any) {
        if twitter {
            twitterButton.isSelected = false
            twitter = false
        } else{
            twitterButton.isSelected = true
            twitter = true
        }
        
    }
    
    @IBAction func searchButtonDidTap(_ sender: Any) {
        let searchByIndex = articlesSearchBySegmentedControl.selectedSegmentIndex
        let timeSearchIndex = timeSearchSegmentedControl.selectedSegmentIndex
        presenter?.searchButtonDidTap(searchByIndex: searchByIndex, timeSearchIndex: timeSearchIndex, facebook: facebook, twitter: twitter)
        
    }
    
    func showSpinner() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    func hideSpinner() {
        activityIndicator.stopAnimating()
    }
    
    func navigateToArticleList(_ articles: Articles) {
        let listOfArticlesVC = ArticleListViewController.initFromStoryboard()
        listOfArticlesVC.articles = articles
        navigationController?.pushViewController(listOfArticlesVC, animated: true)
        
    }
}
