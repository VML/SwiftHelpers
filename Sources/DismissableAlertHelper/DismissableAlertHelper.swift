import UIKit

public protocol DismissableAlertHelping {
    func show(title: String, message: String, dismiss: String, animated: Bool)
    func showError(_ error: Error, animated: Bool)
}

class DismissableAlertHelper: DismissableAlertHelping {

    public init(_ viewController: UIViewController?) {
        self.viewController = viewController
    }

    public weak var viewController: UIViewController?

    public func show(title: String, message: String, dismiss: String, animated: Bool) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: dismiss, style: .cancel, handler: nil))
        viewController?.present(alertController, animated: animated, completion: nil)
    }

    public func showError(_ error: Error, animated: Bool) {
        self.show(title: "_error".localized(),
                  message: "\(error)",
                  dismiss: "_dismiss".localized(),
                  animated: animated)
    }
}
