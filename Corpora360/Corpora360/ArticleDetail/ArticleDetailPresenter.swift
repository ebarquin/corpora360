
protocol ArticleDetailPresenter {
    func attachView(view: ArticleDetailView)
}

class ArticleDetailPresenterImpl {
    var view: ArticleDetailView?
    func attachView(view: ArticleDetailView) {
        self.view = view
    }
    
}
