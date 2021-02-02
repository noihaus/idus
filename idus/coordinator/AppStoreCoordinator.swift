//
//  StoreCoordinator.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import UIKit

protocol AppStoreCoordinatorProtocol: Coordinator {
}
class AppStoreCoordinator: AppStoreCoordinatorProtocol {
    
    weak var navigatorController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigatorController = navigationController
    }
    
    func Start() {
        guard let navi = navigatorController else {
            return
        }
        
        let interactor = AppStoreInteractor()
        let viewmodel = AppStoreViewModel(interactor: interactor, coordinator: self)
        let containerViewController = AppStoreViewController(viewmodel: viewmodel)
        containerViewController.title = "아이디어스(idus)"
        containerViewController.view.backgroundColor = #colorLiteral(red: 0.9278188944, green: 0.9205012321, blue: 0.9334129095, alpha: 1)
        navi.pushViewController(containerViewController, animated: true)
    }
}
