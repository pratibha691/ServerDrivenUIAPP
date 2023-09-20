//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 18/09/23.
//

import Foundation
import UIKit

struct Components {
    let viewData: [Field]
    let view: [UIView]
}

class LoginViewModel {
    
    private var service: NetworkServiceProtocol
    weak var buttonDelegate: ButtonActionDelegate?
    weak var textFieldDelegate: TextFieldActionDelegate?

    var components: [Components] =  []
    var currentScreenData:OnBoardingModel?
    
    init(service: NetworkServiceProtocol, buttonDelegate: ButtonActionDelegate?, textFieldDelegate: TextFieldActionDelegate?) {
        self.service = service
        self.buttonDelegate = buttonDelegate
        self.textFieldDelegate = textFieldDelegate
    }
    
    func load(completion: @escaping(Bool) -> Void)  {
        
        service.load("login") { [weak self](result: Result<OnBoardingModel, Error>) in
            switch result {
            case .success(let screenModel):
                self?.currentScreenData = screenModel
                let screenBuilder = ScreenBuilder(elements: screenModel.body?.fields ?? [], buttonDelegate: self?.buttonDelegate, textFieldDelegate: self?.textFieldDelegate)
                self?.components = [Components(viewData: screenModel.body?.fields ?? [], view: screenBuilder.buildUIComponents())]
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
