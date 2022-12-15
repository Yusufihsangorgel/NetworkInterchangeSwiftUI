//
//  LocalService.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Yusuf İhsan Görgel on 15.12.2022.
//

import Foundation

class LocalService : INetworkService {
    var type: String = "Localservice"
    func fetchUsers(_ resource: String) async throws -> [UserModel] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource not found")
        }
        let data = try Data(contentsOf: URL(filePath: path))
                          
        return try JSONDecoder().decode([UserModel].self, from: data)
    }
    
    
}
