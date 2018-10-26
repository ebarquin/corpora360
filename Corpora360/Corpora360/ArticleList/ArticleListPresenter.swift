
protocol ArticleListPresenter {
    func attachView(view: ArticleListView)
}

class ArticleListPresenterImpl: ArticleListPresenter {
    var view: ArticleListView?
    func attachView(view: ArticleListView) {
        self.view = view
    }
}
