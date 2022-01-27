//
//  MainTabController.swift
//  TwitterClone
//
//  Created by 김수빈 on 2022/01/28.
//

import UIKit

class MainTabController: UITabBarController {

    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    //MARK: - Helpers
    // 탭바 하위 뷰 컨트롤러 설정
    func configureViewControllers() {
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image:UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationController()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationController()
        let nav4 = templateNavigationController(image: UIImage(named: "mail"), rootViewController: conversations)
        
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
