//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Beyza Nur Tekerek on 11.10.2024.
//

import Foundation

protocol UserService {
    func fetchUsers(completion: @escaping(Result<User, Error>) -> Void)
}
