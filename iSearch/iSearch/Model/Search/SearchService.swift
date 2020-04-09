//
//  SearchService.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Alamofire
import EFInternetIndicator
import Moya
import SwiftyJSON

let searchProvider = MoyaProvider<SearchService>(plugins: [CachePolicyPlugin()])

enum DeliveryService {
    case getDeliveries
}

// MARK: - TargetType Protocol Implementationm

extension DeliveryService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.npoint.io/d945963bf319f2316bd7")!
    }
    
    var path: String {
        switch self {
        case .getDeliveries: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDeliveries: return .get
        }
    }
    
    var sampleData: Data {
        return Data(base64Encoded: "")!
    }
    
    var task: Task {
        switch self {
        case .getDeliveries: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}

// MARK: - CatchePolicyGettable

extension DeliveryService: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .getDeliveries: return .useProtocolCachePolicy
        }
    }
}








