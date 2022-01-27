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
    //탭바 하위 뷰 컨트롤러 설정
    func configureViewControllers() {
        
        let feed = FeedController()
        feed.tabBarItem.image = UIImage(named: "home_unselected")
        
        let explore = ExploreController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")
        
        let notifications = NotificationController()
        notifications.tabBarItem.image = UIImage(named: "like_unselected")
        
        let conversations = ConversationController()
        conversations.tabBarItem.image = UIImage(named: "mail")
        
        viewControllers = [feed, explore, notifications, conversations]
    }
}
