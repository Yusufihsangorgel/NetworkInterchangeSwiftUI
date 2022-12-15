//
//  NetworkService.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Yusuf İhsan Görgel on 15.12.2022.
//

import Foundation


protocol INetworkService {
    
    func fetchUsers(_ resourceName: String) async  throws -> [UserModel]
    var type : String { get }
}
