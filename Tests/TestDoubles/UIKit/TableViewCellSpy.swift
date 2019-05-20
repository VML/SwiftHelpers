import UIKit

class TableViewCellSpy: UITableViewCell {

    convenience init() {
        self.init(style: .default, reuseIdentifier: "TableViewCellSpy")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var timesCalled: [String:Int] = [:]
    var valueFor: [String:[String:Any]] = [:]
}
