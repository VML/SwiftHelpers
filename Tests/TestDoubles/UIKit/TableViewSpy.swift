import UIKit

class TableViewSpy: UITableView {

    convenience init() {
        self.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200),
                  style: .plain)
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var timesCalled: [String:Int] = [:]
    var valueFor: [String:[String:Any]] = [:]

    private lazy var _refreshControl: UIRefreshControl? = RefreshControlSpy()

    override var refreshControl: UIRefreshControl? {
        get {
            return _refreshControl
        }
        set {/**/}
    }

    var refreshControlSpy: RefreshControlSpy? {
        return self.refreshControl as? RefreshControlSpy
    }

    override func reloadData() {
        timesCalled[#function] = (timesCalled[#function] ?? 0) + 1
    }

    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        return TableViewCellSpy()
    }

    override func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView? {
        return TableViewHeaderSpy()
    }
}
