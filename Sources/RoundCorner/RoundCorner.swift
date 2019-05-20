import UIKit

// MARK: Button
class RoundCornerButton: UIButton, RoundCorner {
    @IBInspectable var borderWidth:  CGFloat = 0
    @IBInspectable var borderColor:  UIColor = UIColor.black
    @IBInspectable var cornerRadius: CGFloat = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyVisualProperties()
    }
}

// MARK: View
class RoundCornerView: UIView, RoundCorner {
    @IBInspectable var borderWidth:  CGFloat = 0
    @IBInspectable var borderColor:  UIColor = UIColor.black
    @IBInspectable var cornerRadius: CGFloat = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyVisualProperties()
    }
}

// MARK: ImageView
class RoundCornerImageView: UIImageView, RoundCorner {
    @IBInspectable var borderWidth:  CGFloat = 0
    @IBInspectable var borderColor:  UIColor = UIColor.black
    @IBInspectable var cornerRadius: CGFloat = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyVisualProperties()
    }
}

protocol RoundCorner: class {
    var borderWidth:  CGFloat { get set }
    var borderColor:  UIColor { get set }
    var cornerRadius: CGFloat { get set }
    var layer: CALayer { get }
    func awakeFromNib()

}

private extension RoundCorner where Self: UIView {
    func applyVisualProperties() {
        self.layer.borderColor  = self.borderColor.cgColor
        self.layer.borderWidth  = self.borderWidth
        self.layer.cornerRadius = self.cornerRadius
        self.layer.masksToBounds = true
    }
}
