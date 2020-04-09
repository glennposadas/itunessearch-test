//
//  CachePolicyPlugin.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Moya

protocol CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy { get }
}

final class CachePolicyPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let cachePolicyGettable = target as? CachePolicyGettable {
            var mutableRequest = request
            if let reachability = try? Reachability() {
                switch reachability.connection {
                case .wifi, .cellular:
                    mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
                default:
                    mutableRequest.cachePolicy = .returnCacheDataElseLoad
                }
            }
            
            mutableRequest.timeoutInterval = 10
            
            return mutableRequest
        }
        
        return request
    }
}

