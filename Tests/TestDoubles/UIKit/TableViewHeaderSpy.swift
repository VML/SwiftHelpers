import UIKit

class TableViewHeaderSpy: UITableViewHeaderFooterView {

    convenience init() {
        self.init(reuseIdentifier: "REUSE_IDENTIFIER")
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var timesCalled: [String:Int] = [:]
    var valueFor: [String:[String:Any]] = [:]
}
