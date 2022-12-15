//
//  WebService.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Yusuf İhsan Görgel on 14.12.2022.
//

import Foundation
import Alamofire






class WebService: INetworkService {
    var type: String = "Webservice"
    
    func fetchUsers(_ resource: String) async throws -> [UserModel] {
        let request = AF.request(resource).serializingDecodable([UserModel].self)
        
        let response = await request.response
        print(response)
    
        switch response.response?.statusCode {
        case 200:
            return response.value!
        default:
            throw NetworkError.invalidServerResponse
        }
    }
}






//https://jsonplaceholder.typicode.com/users


 enum ServicePath: String {
case users = "users"
    
    func toService() -> String {
        return "https://jsonplaceholder.typicode.com/\(rawValue)"
    }
}



enum NetworkError: Error {
    case invalidServerResponse
}

