import XCTest

class DismissableAlertHelperMockExampleTests: XCTestCase {

    var mockDismissableAlertHelper: DismissableAlertHelperMock!

    override func setUp() {
        mockDismissableAlertHelper = DismissableAlertHelperMock()
    }

    func test_it_should_show_an_alert() {
        mockDismissableAlertHelper.show(title: "hello", message: "there", dismiss: "goodbye", animated: false)

        then("it should present an alert dialog") {
            XCTAssertTrue(mockDismissableAlertHelper.didShow(title: "hello", message: "there", dismiss: "goodbye"))
        }
    }

    func test_it_should_show_an_error() {
        mockDismissableAlertHelper.showError(DummyError(), animated: false)

        then("it should present an alert dialog") {
            XCTAssertTrue(mockDismissableAlertHelper.didShowError(error: DummyError()))
        }
    }
}
