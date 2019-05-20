import UIKit

@IBDesignable
public class RotatedLabelViewIB: RotatedLabelView {

    @IBInspectable var textDirectionFromBottom: Bool {
        get { return (textDirection == .fromBottom) }
        set { textDirection = (newValue) ? .fromBottom : .fromTop }
    }

    @IBInspectable override var fontSize: CGFloat {
        get { return super.fontSize }
        set { super.fontSize = newValue }
    }

    @IBInspectable override var text: String {
        get { return super.text }
        set { super.text = newValue }
    }
}

public class RotatedLabelView: UIView {

    public enum TextDirection {
        case fromTop, fromBottom
    }

    typealias TextAttributes = [NSAttributedString.Key: Any]

    convenience init(text: String,
                     fontSize: CGFloat = 16,
                     textDirection: TextDirection = .fromBottom) {
        self.init()
        self.text = text
        self.fontSize = fontSize
        self.textDirection = textDirection
    }

    let padding: CGFloat = 4.0

    let textLayer = CATextLayer()

    var textSize: CGSize {
        return CGSize(width: textWidth, height: textHeight)
    }

    private var textWidth: CGFloat {
        return ceil((text as NSString).size(withAttributes: textAttributes).width) + padding * 2
    }

    private var textHeight: CGFloat {
        return ceil((text as NSString).size(withAttributes: textAttributes).height)
    }

    var textFont: UIFont {
        return UIFont.systemFont(ofSize: fontSize)
    }

    private let textParagraphStyle: NSParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
    }()

    private var textAttributes: TextAttributes {
        return [
            .font: textFont,
            .foregroundColor: tintColor.cgColor,
            .paragraphStyle: textParagraphStyle
        ]
    }

    var textDirection: TextDirection = .fromBottom {
        didSet {
            updateDisplay()
        }
    }

    var fontSize: CGFloat = 12 {
        didSet {
            updateDisplay()
        }
    }

    override public var backgroundColor: UIColor? {
        didSet {
            textLayer.backgroundColor = backgroundColor?.cgColor
        }
    }

    var text: String = "Label" {
        didSet {
            updateDisplay()
        }
    }


    #if !TARGET_INTERFACE_BUILDER
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateDisplay()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateDisplay()
    }
    #endif

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateDisplay()
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        updateDisplay()
    }

    func updateDisplay() {

        if (textLayer.superlayer == nil) {
            layer.addSublayer(textLayer)
        }

        let rotation: CGFloat = (textDirection == .fromBottom) ? 2 : -2

        let textFrame = CGRect(x: layer.bounds.origin.x,
                               y: (layer.bounds.height - textSize.width)/2,
                               width: textSize.height,
                               height: textSize.width)

        textLayer.setValue(CGFloat.pi/rotation, forKeyPath:"transform.rotation")
        textLayer.contentsScale   = UIScreen.main.scale
        textLayer.font            = textFont
        textLayer.fontSize        = fontSize
        textLayer.string          = text
        textLayer.frame           = textFrame
        textLayer.alignmentMode   = .center
        textLayer.foregroundColor = tintColor.cgColor
        layer.backgroundColor     = UIColor.clear.cgColor
    }
}
