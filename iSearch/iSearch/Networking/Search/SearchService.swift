//
//  SearchService.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Moya

let searchProvider = MoyaProvider<SearchService>(plugins: [CachePolicyPlugin()])

enum SearchService {
    /// Search for tracks.
    /// https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all
    case search(term: String, country: String, media: String)
}

// MARK: - TargetType Protocol Implementation

extension SearchService: TargetType {
    var baseURL: URL {
        CoreService.baseURLString
    }
    
    var path: String {
        switch self {
        case .search: return "/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search: return .get
        }
    }
    
    var sampleData: Data {
        return CoreService.stubbedResponse("SearchResult")
    }
    
    var task: Task {
        switch self {
        case let .search(term, country, media):
            return .requestParameters(
                parameters: [
                    "term": term,
                    "country" : country,
                    "media": media
                ], encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}

// MARK: - CatchePolicyGettable

extension SearchService: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .search: return .useProtocolCachePolicy
        }
    }
}
