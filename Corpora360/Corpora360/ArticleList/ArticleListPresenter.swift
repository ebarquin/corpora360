
protocol ArticleListPresenter {
    func attachView(view: ArticleListView)
    func articleItemDidTap(article: Article)
}

class ArticleListPresenterImpl: ArticleListPresenter {
    var view: ArticleListView?
    func attachView(view: ArticleListView) {
        self.view = view
    }
    
    func articleItemDidTap(article: Article) {
        view?.navigateToArticleDetail(article: article)
    }
    
}
