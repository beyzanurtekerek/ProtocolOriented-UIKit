//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Beyza Nur Tekerek on 11.10.2024.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService
    weak var output : UserViewModelOutput?
    
    init(userService: UserService, output: UserViewModelOutput? = nil) {
        self.userService = userService
        self.output = output
    }
    
    func fetchUsers() {
        
        userService.fetchUsers { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username)
            case .failure(_):
                self?.output?.updateView(name: "no user", email: "", userName: "")
            }
        }
        
    }
    
}
