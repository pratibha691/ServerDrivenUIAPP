//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 18/09/23.
//

import Foundation
import UIKit
class LoginViewModel {
    
    private var service: NetworkServiceProtocol
    var components: [UIView] =  []
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load(completion: @escaping(Bool) -> Void)  {
        
        service.load("LoginScreenUI") { (result: Result<ScreenModel, Error>) in
            switch result {
            case .success(let screenModel):
                self.components = screenModel.buildUIComponents()
                // Handle the successfully loaded and decoded `ScreenModel`.
                // Example: update your UI with the loaded data.
                completion(true)
                debugPrint(screenModel)
            case .failure(let error):
                // Handle the error, such as displaying an error message to the user.
                debugPrint(error)
            }
        }
        
    }
    
}
