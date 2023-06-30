//
//  StoreView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 28.06.2023.
//

import SwiftUI
import UIKit

class MainTabBarController: UITabBarController,UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let catalogView = UINavigationController(rootViewController: UIHostingController(rootView: CatalogView()))
         catalogView.tabBarItem = UITabBarItem(title: "Catalog", image: UIImage(systemName: "house"), tag: 0)
         catalogView.navigationBar.topItem?.title = "Hello, Sneakerhead!"
        
        let cartView = UINavigationController(rootViewController: UIHostingController(rootView: CartView()))
        cartView.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 1)
        cartView.navigationBar.topItem?.title = "Cart"
        
        let profileView = UINavigationController(rootViewController: UIHostingController(rootView: ProfileView()))
        profileView.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        profileView.navigationBar.topItem?.title = "Profile"

        viewControllers = [catalogView, cartView, profileView]
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.black
        tabBar.unselectedItemTintColor = UIColor.gray
        tabBar.clipsToBounds = true
        
        let border = CALayer()
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1)
        border.borderWidth = 1
        tabBar.layer.addSublayer(border)
        tabBar.layer.masksToBounds = true
    }
}

struct StoreView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<StoreView>) -> UITabBarController {
        return MainTabBarController()
    }

    func updateUIViewController(_ uiViewController: UITabBarController, context: UIViewControllerRepresentableContext<StoreView>) {
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}
