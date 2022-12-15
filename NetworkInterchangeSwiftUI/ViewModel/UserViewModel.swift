//
//  UserViewModel.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Yusuf İhsan Görgel on 14.12.2022.
//
import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    //let webservice = Webservice()
    private var service : INetworkService
    init(service: INetworkService) {
        self.service = service
        Task.detached {
            await self.downloadUsers()
        }
    }
    
    func downloadUsers() async {
        
        
        var resource = ""
               if service.type == "Webservice" {
                   resource = ServicePath.users.toService()
               } else {
                   resource = "user"
               }
        do {
            let users = try await service.fetchUsers(resource)

            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }

        } catch {
            print(error)
        }
        
    }
    
    
}



struct UserViewModel {
    
    let user : UserModel
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email: String {
        user.email
    }
    
}
