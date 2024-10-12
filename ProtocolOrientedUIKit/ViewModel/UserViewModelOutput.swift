//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Beyza Nur Tekerek on 11.10.2024.
//

import Foundation

protocol UserViewModelOutput : AnyObject {
    
    func updateView(name: String, email: String, userName: String)
    
}
