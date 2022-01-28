//
//  MainTabController.swift
//  TwitterClone
//
//  Created by 김수빈 on 2022/01/28.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {

    //MARK: - Properties
    
    // 플로팅 버튼
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        logUserOut()
        view.backgroundColor = .twitterBlue
        authenticateUserAndConfigureUI()
    }
    
    //MARK: - API
    
    // 로그인 여부 판단
    func authenticateUserAndConfigureUI(){
        // 유저가 로그인하지 않음
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }else{ // 유저가 로그인 함
            configureViewControllers()
            configureUI()
        }
    }
    
    // 로그아웃
    func logUserOut(){
        do{
            try Auth.auth().signOut()
        } catch let error{
            print("DEBUG: 로그아웃 실패 \(error.localizedDescription)")
        }
    }
    
    //MARK: - Selectors
    
    // 플로팅 버튼 클릭 함수
    @objc func actionButtonTapped(){
        print(123)
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        view.addSubview(actionButton)
        // 플로팅 버튼 오토레이아웃 설정
//        actionButton.translatesAutoresizingMaskIntoConstraints = false
//        // 버튼 높이
//        actionButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
//        // 버튼 너비
//        actionButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
//        // 버튼 Y 좌표
//        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
//        // 버튼 X 좌표
//        actionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        // extension 활용하여 오토레이아웃 설정
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        
        // 원 모양
        actionButton.layer.cornerRadius = 56 / 2
        
    }
    
    // 탭바 하위 뷰 컨트롤러 설정
    func configureViewControllers() {
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image:UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationController()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationController()
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    // 내비게이션 컨트롤러 이미지, 색상 설정
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
}
