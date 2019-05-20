import UIKit

class StoryboardLoader {
    static func loadViewController(from storyboardName: String, bundle: Bundle = .main) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateInitialViewController()
    }
}
