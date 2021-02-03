//
//  StoreViewModel.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import Foundation
import RxSwift
import RxCocoa

protocol AppStoreViewModelOutputs {
    var screenshotUrl:PublishSubject<[URL?]> { get }
    var discription: PublishSubject<String> { get }
    var category: PublishSubject<[String]> { get }
    var filesizeMbyte: PublishSubject<String> { get }
    var version: PublishSubject<String> { get }
    var releaseNotes: PublishSubject<String> { get }
}
protocol AppStoreViewModelInputs {
    func fetchData()
}
protocol AppStoreViewModelType {
    var outputs: AppStoreViewModelOutputs { get }
    var inputs: AppStoreViewModelInputs { get }
}
class AppStoreViewModel: AppStoreViewModelType, AppStoreViewModelOutputs, AppStoreViewModelInputs {

    var outputs: AppStoreViewModelOutputs { return self }
    var inputs: AppStoreViewModelInputs { return self }
    
    var screenshotUrl = PublishSubject<[URL?]>()
    var discription = PublishSubject<String>()
    var category = PublishSubject<[String]>()
    var filesizeMbyte = PublishSubject<String>()
    var version = PublishSubject<String>()
    var releaseNotes = PublishSubject<String>()
    
    private var interactor: AppStoreInteractorProtocol
    private var coordinator: AppStoreCoordinatorProtocol
    private let diaposebag = DisposeBag()
    
    init(interactor: AppStoreInteractorProtocol, coordinator: AppStoreCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
}
extension AppStoreViewModel {
    func fetchData() {
        interactor.fetch()
            .map{ $0.results.first }
            .map{ $0! }
            .subscribe(onNext: { [weak self] data in
                self?.screenshotUrl.onNext(data.screenshotUrls.map{ URL(string: $0) })
                self?.discription.onNext(data.description)
                self?.category.onNext(data.genres.map{"#\($0)"})
                self?.filesizeMbyte.onNext("\(round(Double(data.fileSizeBytes)!/100000)/10) MB" )
                self?.version.onNext(data.version)
                self?.releaseNotes.onNext(data.releaseNotes)
            },onError: { (error) in
                print("error : \(error.localizedDescription)")
            }).disposed(by: diaposebag)
    }
}

