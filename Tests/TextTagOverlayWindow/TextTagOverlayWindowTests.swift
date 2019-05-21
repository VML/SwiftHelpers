import XCTest

class TextTagOverlayWindowTests: XCTestCase {

    func test_default_configuration() {

        given("it is constructed with minimal arguments") {
            let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            let subject = TextTagOverlayWindow(frame: frame, tagText: "TAG_TEXT")

            then("infoView has text set to build info") {
                XCTAssertEqual(subject.infoView.text, "TAG_TEXT")
            }

            then("infoView has font size set to 16") {
                XCTAssertEqual(subject.infoView.fontSize, 16.0)
            }

            then("infoView has text direction set to \"from bottom\"") {
                XCTAssertEqual(subject.infoView.textDirection, .fromBottom)
            }

            then("it allows touch events passed through to main key window") {
                XCTAssertFalse(subject.isUserInteractionEnabled)
                XCTAssertFalse(subject.infoView.isUserInteractionEnabled)
            }

            then("it presents itself above all other windows") {
                XCTAssertTrue(subject.isKeyWindow)
                XCTAssertEqual(subject.windowLevel, UIWindow.Level.alert)
            }
        }
    }

    func test_custom_configuration() {

        given("it is constructed with custom font size and text direction") {
            let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            let subject = TextTagOverlayWindow(frame: frame,
                                               tagText: "TAG_TEXT",
                                               fontSize: 8.0,
                                               textDirection: .fromTop)

            then("infoView has text set to build info") {
                XCTAssertEqual(subject.infoView.text, "TAG_TEXT")
            }

            then("infoView has font size set to custom size") {
                XCTAssertEqual(subject.infoView.fontSize, 8.0)
            }

            then("infoView has text direction set to custom direction") {
                XCTAssertEqual(subject.infoView.textDirection, .fromTop)
            }

            then("it allows touch events passed through to main key window") {
                XCTAssertFalse(subject.isUserInteractionEnabled)
                XCTAssertFalse(subject.infoView.isUserInteractionEnabled)
            }

            then("it presents itself above all other windows") {
                XCTAssertTrue(subject.isKeyWindow)
                XCTAssertEqual(subject.windowLevel, UIWindow.Level.alert)
            }
        }
    }
}
