//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 18/09/23.
//

import Foundation
import UIKit

struct Components {
    let viewData: [ScreenElement]
    let view: [UIView]
}

class LoginViewModel {
    
    private var service: NetworkServiceProtocol
    weak var delegate: ButtonActionDelegate?

    var components: [Components] =  []
    
    init(service: NetworkServiceProtocol, delegate: ButtonActionDelegate?) {
        self.service = service
        self.delegate = delegate
    }
    
    func load(completion: @escaping(Bool) -> Void)  {
        
        service.load("LoginScreenUI") { [weak self](result: Result<ScreenModel, Error>) in
            switch result {
            case .success(let screenModel):
                let screenBuilder = ScreenBuilder(elements: screenModel.elements ?? [], delegate: self?.delegate)
                self?.components = [Components(viewData: screenModel.elements ?? [], view: screenBuilder.buildUIComponents())]
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
