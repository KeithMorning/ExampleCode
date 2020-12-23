import XCTest
@testable import iOSExample

final class iOSExampleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }

    static var allTests = [
        ("testExample", testExample),
    ]
    
    func testCapitalizedPropertyWrapper(){
        struct User {
            @Capitalized var firstName:String
        }
        
        let user = User(firstName: "jelf")
        XCTAssertEqual(user.firstName, "Jelf")
    }
    
    func testUserStanderPropertyWrapper(){
        
        struct SettingViewModel {
            @UserDefaultsBacked<Bool>(key: "switch_status") static var switchOn:Bool?
            @UserDefaultsBacked<String>(key: "user_name") static var userName:String?
        }

    }
}
