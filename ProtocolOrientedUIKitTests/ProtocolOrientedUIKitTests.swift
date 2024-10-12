//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Beyza Nur Tekerek on 11.10.2024.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    
    private var userViewModel : UserViewModel!
    private var userService  : MockUserService!
    private var output : MockUserViewModelOutput!

    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }

    func testUpdateView_whenAPISucces_showsEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Beyza Nur", username: "Tekerek", email: "beyzanurtekerk@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        userService.fetchUserMockResult = .success(mockUser)
        userViewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.userName, "beyzanurtekerk@gmail.com")
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "no user")
    }

}

// user service taklit
class MockUserService : UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, any Error>?
    func fetchUsers(completion: @escaping (Result<ProtocolOrientedUIKit.User, any Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}

// output taklit
class MockUserViewModelOutput : UserViewModelOutput {
    var updateViewArray : [(name: String, email: String, userName: String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name, email, userName))
    }
}
