
import Foundation
import UIKit

public protocol StoryboardViewController {
    static var storyboardName: String { get }
}

extension StoryboardViewController where Self: UIViewController {
    
    public static func initFromStoryboard(bundle: Bundle? = nil) -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: bundle).instantiateInitialViewController() else {
            fatalError()
        }
        
        return viewController as! Self
    }
    
    public static func initFromStoryboard(bundleName: String) -> Self {
        let podBundle = Bundle(for: Self.self)
        let bundleURL = podBundle.url(forResource: bundleName, withExtension: "bundle")!
        let bundle = Bundle(url: bundleURL)
        
        return Self.initFromStoryboard(bundle: bundle)
    }
    
}
