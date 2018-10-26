
protocol SearchMenuPresenter {
    func attachView(view: SearchMenuView)
    func searchButtonDidTap(searchByIndex: Int, timeSearchIndex: Int, facebook: Bool, twitter: Bool)
    
}

class SearchMenuPresenterImpl: SearchMenuPresenter {

    var view: SearchMenuView?
    func attachView(view: SearchMenuView) {
        self.view = view
    }
    
    func searchButtonDidTap(searchByIndex: Int, timeSearchIndex: Int, facebook: Bool, twitter: Bool) {
        self.view?.showSpinner()
        let searchByParams = self.searchByParams(index: searchByIndex)
        let timeSearchParams = self.timeSearchParams(index: timeSearchIndex)
        let sharedMethodParams = self.sharedMethodParams(facebook: facebook, twitter: twitter)
        let params = "\(searchByParams)/all-sections/\(sharedMethodParams)/\(timeSearchParams).json"
        let articleManager = ArticleManagerImpl()
        DownloadArticlesInteractorImpl(articleManager: articleManager).execute(params: params) { articles in
            
            self.view?.navigateToArticleList(articles)
            self.view?.hideSpinner()
        }
    }
     private func searchByParams(index: Int) -> String {
        switch index {
        case 0:
            return "mostemailed"
        case 1:
            return "mostshared"
        case 2:
            return "mostviewed"
        default:
            return ""
        }
    }
    
    private func timeSearchParams(index: Int) -> String {
        switch index {
        case 0:
            return "1"
        case 1:
            return "7"
        case 2:
            return "30"
        default:
            return ""
        }
    }
    
    private func sharedMethodParams(facebook: Bool, twitter:Bool) -> String {
        if facebook && twitter {
            return "facebook,twitter"
        }
        if facebook {
            return "facebook"
        }
        if twitter {
            return "twitter"
        }
        return ""
    }
    
}
