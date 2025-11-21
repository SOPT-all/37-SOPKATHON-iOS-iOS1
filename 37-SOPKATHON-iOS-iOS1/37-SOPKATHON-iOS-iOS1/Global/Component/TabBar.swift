//
//  TabBar.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/22/25.
//

import UIKit

final class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        appearance()
    }

    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: ViewController())
        vc1.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "square.and.arrow.up"), tag: 1)
        let vc2 = UINavigationController(rootViewController: ViewController())
        vc2.tabBarItem = UITabBarItem(title: "어쩌구", image: UIImage(systemName: "square.and.arrow.up"), tag: 2)
        let vc3 = UINavigationController(rootViewController: ViewController())
        vc3.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "square.and.arrow.up"), tag: 3)
        let vc4 = UINavigationController(rootViewController: ViewController())
        vc4.tabBarItem = UITabBarItem(title: "내서재", image: UIImage(systemName: "square.and.arrow.up"), tag: 4)
        self.viewControllers = [vc1, vc2, vc3, vc4]
    }
    
    func appearance() {
        let barAppearance = UITabBarAppearance()
        
        // 배경
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = .gray
        
        // 아이콘 기본 색상 설정
        barAppearance.stackedLayoutAppearance.normal.iconColor = .green
        barAppearance.stackedLayoutAppearance.selected.iconColor = .yellow
        barAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 10),
            .foregroundColor: UIColor.red
        ]
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 10),
            .foregroundColor: UIColor.green
        ]
        
        // 실제 탭바에 커스텀한 Appearance 적용
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.scrollEdgeAppearance = barAppearance
        
        // 탭바 아이템 위치 조정
        self.tabBar.itemPositioning = .centered
    }
}
