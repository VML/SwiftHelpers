import UIKit

class ViewControllerSpy: UIViewController {

    var parentWindow: UIWindow?
    var embeddedInWindow: ViewControllerSpy {
        parentWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        parentWindow!.rootViewController = self.navigationController ?? self
        return self
    }

    var navigationControllerSpy: NavigationControllerSpy?
    var inNavigationControllerSpy: ViewControllerSpy {
        navigationControllerSpy = NavigationControllerSpy(rootViewController: self)
        return self
    }

    override var navigationController: UINavigationController? {
        get { return navigationControllerSpy }
    }

    var _presentedViewController: UIViewController?
    override var presentedViewController: UIViewController? {
        get { return _presentedViewController }
        set { _presentedViewController = newValue }
    }

    var _presentingViewController: UIViewController?
    override var presentingViewController: UIViewController? {
        get { return _presentingViewController }
    }

    var wasCalled_present: Bool = false
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        wasCalled_present = true
        _presentedViewController = viewControllerToPresent
        if let mockToPresent = viewControllerToPresent as? ViewControllerSpy {
            mockToPresent._presentingViewController = self
        }
        completion?()
    }

    var wasCalled_dismiss: Bool = false
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        wasCalled_dismiss = true
        _presentedViewController = nil
        completion?()
    }

    var wasCalled_performSegue: Bool = false
    var valueFor_performSegue_identifier: String = ""
    var valueFor_performSegue_sender: Any? = nil
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        wasCalled_performSegue = true
        valueFor_performSegue_identifier = identifier
        valueFor_performSegue_sender = sender
    }
}
