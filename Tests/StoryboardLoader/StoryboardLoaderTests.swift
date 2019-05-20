import XCTest
import UIKit

class StoryboardLoaderTests: XCTestCase {

    func test_LoadStoryboard() {
        when("load initial view controller from storyboard") {
            let subject = StoryboardLoader.loadViewController(from: "StoryboardLoaderTests",
                                                              bundle: Bundle(for: type(of: self)))

            then("it should be a view controller with a view") {
                XCTAssertNotNil(subject?.view)
            }
        }
    }
}
