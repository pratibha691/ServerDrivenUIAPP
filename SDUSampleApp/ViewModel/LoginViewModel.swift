//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 18/09/23.
//

import Foundation
class LoginViewModel {
    
    private var service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load()  {
        
        service.load("LoginScreenUI") { (result: Result<ScreenModel, Error>) in
            switch result {
            case .success(let screenModel):
                // Handle the successfully loaded and decoded `ScreenModel`.
                // Example: update your UI with the loaded data.
                debugPrint(screenModel)
            case .failure(let error):
                // Handle the error, such as displaying an error message to the user.
                debugPrint(error)
            }
        }
        
    }
    
}
