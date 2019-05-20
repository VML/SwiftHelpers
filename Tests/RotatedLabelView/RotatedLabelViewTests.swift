import XCTest

class RotatedLabelViewTests: XCTestCase {

    var subject: RotatedLabelViewIB!

    override func setUp() {
        subject = createSubject()
    }

    func createSubject() -> RotatedLabelViewIB {
        return RotatedLabelViewIB(text: "text text",
                                  fontSize: 8.0,
                                  textDirection: .fromTop)
    }

    func AssertRoughlyEqual(_ lhs: CGFloat, _ rhs: CGFloat) {
        let lhs = Double(lhs) * 10
        let rhs = Double(rhs) * 10
        let rounded: (Double, Double) = (lhs < 0 || rhs < 0)
            ? (ceil(lhs) / 10, ceil(rhs) / 10)
            : (floor(lhs) / 10, floor(rhs) / 10)
        XCTAssertEqual(rounded.0, rounded.1)
    }

    func test_default_configuration() {
        given("it is created") {
            with("text set") {
                XCTAssertEqual(subject.text, "text text")
            }

            with("font size set") {
                XCTAssertEqual(subject.fontSize, 8.0)
            }

            with("text direction set") {
                XCTAssertEqual(subject.textDirection, .fromTop)
            }

            with("textLayer sublayer") {
                XCTAssertNotNil(subject.layer.sublayers?.first { $0 is CATextLayer })
            }
        }
    }

    func test_update_text_direction() {
        when("text direction changed to fromBottom") {
            subject.textDirection = .fromBottom

            then("accessing textDirectionFromBottom returns true") {
                XCTAssertEqual(subject.textDirectionFromBottom, true)
            }

            then("it applies correct rotation transform to the text layer") {
                let rotationValue = subject.textLayer
                    .value(forKeyPath: "transform.rotation") as! CGFloat

                AssertRoughlyEqual(rotationValue, 1.5)
            }
        }

        when("text direction changed to fromTop") {
            subject.textDirection = .fromTop

            then("accessing textDirectionFromBottom returns false") {
                XCTAssertEqual(subject.textDirectionFromBottom, false)
            }

            then("it applies correct rotation transform to the text layer") {
                let rotationValue = subject.textLayer
                    .value(forKeyPath: "transform.rotation") as! CGFloat

                AssertRoughlyEqual(rotationValue, -1.5)
            }
        }

        when("text direction boolean set true via IB") {
            subject.textDirectionFromBottom = true

            then("it sets the text direction to .fromBottom") {
                XCTAssertEqual(subject.textDirection, .fromBottom)
            }
        }

        when("text direction boolean set true via IB") {
            subject.textDirectionFromBottom = false

            then("it sets the text direction to .fromTop") {
                XCTAssertEqual(subject.textDirection, .fromTop)
            }
        }
    }

    func test_update_fontSize() {
        when("font size changed") {
            subject.fontSize = 8.0

            then("it applies correct settings to the text layer") {
                XCTAssertEqual(subject.textLayer.fontSize, 8.0)
            }

            then("it is reflected in the textFont property") {
                XCTAssertEqual(subject.textFont, UIFont.systemFont(ofSize: 8.0))
            }
        }
    }

    func test_update_text() {
        when("text changed") {
            subject.text = "something to say here"

            then("it updates the text layer") {
                XCTAssertEqual(subject.textLayer.string as? String, "something to say here")
            }
        }
    }

    func test_update_background_color() {
        when("text changed") {
            subject.backgroundColor = UIColor.purple

            then("it updates the text layer's background color") {
                XCTAssertEqual(subject.textLayer.backgroundColor, UIColor.purple.cgColor)
            }
        }
    }
}
