import UIKit

public class TextTagOverlayWindow: UIWindow {

    public var infoView: RotatedLabelView!

    public convenience init(frame: CGRect,
                            tagText: String,
                            fontSize: CGFloat = 16,
                            textDirection: RotatedLabelView.TextDirection = .fromBottom) {
        self.init(frame: frame)

        rootViewController = UIViewController(nibName: nil, bundle: nil)
        windowLevel = UIWindow.Level.alert

        infoView = RotatedLabelView(text: tagText, fontSize: fontSize, textDirection: textDirection)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.tintColor = .white
        infoView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        infoView.isUserInteractionEnabled = false
        rootViewController?.view = infoView
        isUserInteractionEnabled = false
        makeKeyAndVisible()
    }
}
