//
//  RegistrationController.swift
//  TwitterClone
//
//  Created by 김수빈 on 2022/01/28.
//

import UIKit

class RegistrationController: UIViewController{
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
    }
}
