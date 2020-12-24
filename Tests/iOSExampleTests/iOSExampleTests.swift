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
    
    override func setUpWithError() throws {
        
    }
    
    override class func setUp() {
        UserDefaults.standard.removeObject(forKey: "switch_status")
        UserDefaults.standard.removeObject(forKey: "user_name")
        UserDefaults.standard.removeObject(forKey: "user_sex")

    }
        
    func testCapitalizedPropertyWrapper(){
        struct User {
            @Capitalized var firstName:String
        }
        
        let user = User(firstName: "jelf")
        XCTAssertEqual(user.firstName, "Jelf")
    }
    
    struct SettingViewModel {
        ///Test default case
        @UserDefaultsBacked(key: "switch_status",defaultValue:true)
        var switchOn:Bool
        
        ///Test default ni case
        @UserDefaultsBacked<String?>(key: "user_name")
        var userName:String?
        
    }

    
    func testUserStanderPropertyWrapper(){
        
        var setting = SettingViewModel()
        setting.switchOn = true
        setting.userName = "keith"
        
        let setting2 = SettingViewModel()
        XCTAssertTrue(setting2.switchOn)
        XCTAssertEqual(setting2.userName, "keith")
        
    }
        
    
}
