import UIKit

class DismissableAlertHelperMock: DismissableAlertHelping {

    init() {}

    var timesCalled: [String:Int] = [:]
    var valueFor: [String:[String:Any]] = [:]

    func show(title: String, message: String, dismiss: String, animated: Bool) {
        timesCalled[#function] = (timesCalled[#function] ?? 0) + 1
        valueFor[#function] = [
            "title": title,
            "message": message,
            "dismiss": dismiss,
            "animated": animated
        ]
    }

    func showError(_ error: Error, animated: Bool) {
        timesCalled[#function] = (timesCalled[#function] ?? 0) + 1
        valueFor[#function] = ["error": error]
    }

    func didShow(title: String, message: String, dismiss: String) -> Bool {
        let funcName = "show(title:message:dismiss:animated:)"
        return ((timesCalled[funcName] ?? 0) > 0)
            && ((valueFor[funcName]!["title"] as! String) == title)
            && ((valueFor[funcName]!["message"] as! String) == message)
            && ((valueFor[funcName]!["dismiss"] as! String) == dismiss)
    }

    func didShowError(error: Error) -> Bool {
        let funcName = "showError(_:animated:)"
        return ((timesCalled[funcName] ?? 0) > 0)
            && ((valueFor[funcName]!["error"] as! Error)
                .localizedDescription == error.localizedDescription)
    }
}
