import XCTest

class DismissableAlertHelperTests: XCTestCase {

    var subject: DismissableAlertHelper!
    var viewControllerSpy: ViewControllerSpy!

    override func setUp() {
        viewControllerSpy = ViewControllerSpy()
        subject = DismissableAlertHelper(viewControllerSpy)
    }

    func test_when_show_is_called_then_it_should_present_alert_on_view_controller() {
        subject.show(title: "hello", message: "there", dismiss: "goodbye", animated: false)
        XCTAssertTrue(viewControllerSpy.wasCalled_present)
        XCTAssert(viewControllerSpy.presentedViewController is UIAlertController)
    }

    func test_when_show_error_is_called_then_it_should_present_alert_on_view_controller() {
        subject.showError(DummyError(), animated: false)
        XCTAssertTrue(viewControllerSpy.wasCalled_present)
        XCTAssert(viewControllerSpy.presentedViewController is UIAlertController)
    }
}
