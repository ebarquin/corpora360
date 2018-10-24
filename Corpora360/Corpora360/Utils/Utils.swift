import Alamofire

//MARK: - Typealiases
public typealias Articles = [Article]
public typealias ErrorClosure = (Error) -> Void

//MARK: - Endpoints
public let ENDPOINT = "https://api.nytimes.com/svc/mostpopular/v2/"
public let PARAMETERS: Parameters = ["api-key" : "32534511931e4dc1b5627b6918ca0d6b"] 

//MARK: - Config
public let CELL_IDENTIFIER = "cellId"

