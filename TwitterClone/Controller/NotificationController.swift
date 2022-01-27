//
//  NotificationController.swift
//  TwitterClone
//
//  Created by 김수빈 on 2022/01/28.
//

import UIKit

class NotificationController: UIViewController{
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
    
        // 내비게이션 바 설정
        navigationItem.title = "Notifications"
    }
}
