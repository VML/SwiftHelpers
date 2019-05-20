import XCTest

class UINavigationControllerPlusCompletionTests: XCTestCase {

    var subject: UINavigationController!
    var window: UIWindow!
    var parentViewController: UIViewController!
    var childViewController: UIViewController!
    var expectCompletion: XCTestExpectation!
    var completion: ()->() {
        return {
            self.expectCompletion.fulfill()
        }
    }

    override func setUp() {
        parentViewController = UIViewController(nibName: nil, bundle: nil)
        childViewController = UIViewController(nibName: nil, bundle: nil)

        subject = UINavigationController(rootViewController: parentViewController)

        window = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        window.rootViewController = subject
        window.makeKeyAndVisible()
        _ = subject.view
    }

    func test_when_push_viewController_non_animated_then_it_calls_completion() {
        expectCompletion = expectation(description: "expectCompletion")
        subject.pushViewController(childViewController, animated: false, completion: completion)

        wait(for: [expectCompletion], timeout: 4.0)
    }

    func test_when_push_viewController_animated_then_it_calls_completion() {
        expectCompletion = expectation(description: "expectCompletion")
        subject.pushViewController(childViewController, animated: true, completion: completion)

        wait(for: [expectCompletion], timeout: 4.0)
    }

    func test_when_pop_viewController_non_animated_then_it_calls_completion() {
        expectCompletion = expectation(description: "expectCompletion")
        subject.pushViewController(childViewController, animated: false)
        subject.popViewController(animated: false, completion: completion)

        wait(for: [expectCompletion], timeout: 4.0)
    }

    func test_when_pop_viewController_animated_then_it_calls_completion() {
        expectCompletion = expectation(description: "expectCompletion")
        subject.pushViewController(childViewController, animated: false)
        subject.popViewController(animated: true, completion: completion)

        wait(for: [expectCompletion], timeout: 4.0)
    }

    func test_when_pop_to_rootViewController_non_animated_then_it_calls_completion() {
        expectCompletion = expectation(description: "expectCompletion")
        subject.pushViewController(childViewController, animated: false)
        subject.popToRootViewController(animated: false, completion: completion)

        wait(for: [expectCompletion], timeout: 4.0)
    }

    func test_when_pop_to_rootViewController_animated_then_it_calls_completion() {
        expectCompletion = expectation(description: "expectCompletion")
        subject.pushViewController(childViewController, animated: false)
        subject.popToRootViewController(animated: false, completion: completion)

        wait(for: [expectCompletion], timeout: 4.0)
    }
}
