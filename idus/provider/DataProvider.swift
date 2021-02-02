//
//  DataProvider.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import Foundation
import Moya

enum DataProvider {
    case lookup
}
// [http://itunes.apple.com/lookup?id=872469884]
extension DataProvider: TargetType {
    var baseURL: URL {
        return URL(string: "http://itunes.apple.com")!
    }
    var path: String {
        switch self {
        case .lookup:
            return "/lookup"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var sampleData: Data {
        return
            "{\"resultCount\":1,\"results\": []}".data(using: String.Encoding.utf8)!
    }
    var task: Task {
        switch self {
        case .lookup:
            return .requestParameters(parameters: ["id": "872469884"], encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        return nil
    }
}
