import XCTest
import UIKit

class RoundCornerTests: XCTestCase {

    let borderColor: UIColor = UIColor.cyan
    let borderWidth: CGFloat = 1.789
    let cornerRadius: CGFloat  = 6.0
    let frame: CGRect = CGRect(x: 0, y: 0, width: 32, height: 32)

    func test_RoundCornerButton() {
        verify("RoundCornerButton", RoundCornerButton(type: .system))
    }

    func test_RoundCornerView() {
        verify("RoundCornerView", RoundCornerView(frame: frame))
    }

    func test_RoundCornerImageView() {
        verify("RoundCornerImageView", RoundCornerImageView(frame: frame))
    }

    private func verify(_ typeName: String, _ subject: RoundCorner) {
        given("\(typeName) with border color, border width, corner radius") {
            subject.borderColor = borderColor
            subject.borderWidth = borderWidth
            subject.cornerRadius = cornerRadius

            given("awakeFromNib()") {
                subject.awakeFromNib()

                then("border color is set") {
                    XCTAssertEqual(subject.layer.borderColor, borderColor.cgColor)
                }
                then("border width is set") {
                    XCTAssertEqual(subject.layer.borderWidth, borderWidth)
                }
                then("corner radius is set") {
                    XCTAssertEqual(subject.layer.cornerRadius, cornerRadius)
                }
                then("clipping is enabled") {
                    XCTAssertTrue(subject.layer.masksToBounds)
                }
            }
        }
    }
}
