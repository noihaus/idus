//
//  AppCoordinator.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import UIKit

class AppCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func Start() {
        guard let navi = self.navigationController else {
            return
        }
        let coordinator = AppStoreCoordinator(navigationController: navi)
        coordinator.Start()
    }
}
