import UIKit

class RefreshControlSpy: UIRefreshControl {

    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var timesCalled: [String:Int] = [:]
    var valueFor: [String:[String:Any]] = [:]

    override func endRefreshing() {
        timesCalled[#function] = (timesCalled[#function] ?? 0) + 1
    }
}
