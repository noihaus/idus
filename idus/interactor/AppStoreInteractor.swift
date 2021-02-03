//
//  StoreInteractor.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import UIKit
import RxSwift
import Moya

protocol AppStoreInteractorProtocol {
    func fetch() -> Observable<DataModel>
}
class AppStoreInteractor: AppStoreInteractorProtocol {
    func fetch() -> Observable<DataModel> {
        let provider = MoyaProvider<DataProvider>()
        return Observable<DataModel>.create { observable -> Disposable in
            provider.request(.lookup) { (response) in
                switch response {
                case .success(let value):
                    let decoder = JSONDecoder()
                    do {
                        let data = try decoder.decode(DataModel.self, from: value.data)
                        observable.onNext(data)
                    } catch let error {
                        observable.onError(error)
                    }
                case .failure(let error):
                    observable.onError(error)
                }
                observable.onCompleted()
            }
            return Disposables.create()
        }
    }
}
