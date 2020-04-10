//
//  ResultHelper.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Foundation
import Kingfisher
import SwiftDate

/**
 The helper for `Result`. Useful for extracting presentables.
 */
extension Result {
    /// Returns the cellType based on `wrapperType` and `kind`.
    /// TODO: make enum for `wrapperType` and `kind`.
    var cellType: DataCellType {
        get {
            if self.wrapperType == "audiobook" {
                return .long
            }
            
            if self.kind == "song" {
                return .short
            }
            
            // Defaults to feature-movie and tv-episode.
            return .long
        }
    }
    
    /// Determines if we are to hide the extra label for date, if movies and books.
    var dateLabelIsHidden: Bool {
        self.cellType == .long
    }
    
    /// Determines if we are to hide the get button
    var getButtonIsHidden: Bool {
        return self.kind == "feature-movie" || self.kind == "tv-episode"
    }
        
    /**
    The Get button title.
    - Since we don't have much time, we can just make a couple of catchers for currency symbol.
    - Ref: https://developer.apple.com/documentation/foundation/nslocale/1642814-currencysymbol
    */
    var currencySymbol: String {
        get {
            if self.currency == "USA" {
                return "$"
            } else if self.currency == "AUD" {
                return "$"
            } else if self.currency == "PHP" {
                return "₱"
            } else {
                return "$"
            }
        }
    }
    
    // MARK: - Presentables
    
    /// The trackname presentable
    var titlePresentable: String {
        get {
            return self.trackName ?? self.collectionName ?? ""
        }
    }
    
    /**
     The subtitle presentable, usually the grayed out part.
        - For song, it's the artist + album.
        - For audiobooks, it's the author.
        - For movies and tv-epidosdes, it's the genres.
     */
    var subtitlePresentable: String {
        get {
            if self.wrapperType == "audiobook" {
                return self.artistName ?? ""
            }
            
            if self.kind == "song" {
                return "\(self.artistName ?? "") - \(self.collectionName ?? "")"
            }
            
            // Defaults to feature-movie and tv-episode.
            return self.primaryGenreName ?? ""
        }
    }
    
    var datePresentable: String {
        get {
            let releaseDate = self.releaseDate ?? ""
            let format = "MMM d, yyyy"
            let formattedDate = releaseDate.toDate(format, region: .current)
            return formattedDate?.toString() ?? ""
        }
    }
    
    /// Get button title presentable
    var getButtonTitlePresentable: String {
        get {
            switch self.cellType {
            case .long: return "GET"
            case .short: return self.trackPricePresentable
            }
        }
    }
    
    /// The track price. Let's just focus on the `trackPrice` for now.
    var trackPricePresentable: String {
        get {
            let trackPrice = self.trackPrice ?? 0.00
            let trackPriceString = String(format:"%.2f", trackPrice)
            return "\(self.currencySymbol) \(trackPriceString)"
        }
    }
    
    /// The artwork 100
    var artworkResource: ImageResource {
        get {
            let artworkUrlString = self.artworkUrl100 ?? self.artworkUrl60 ?? ""
            let url = URL(string: artworkUrlString)!
            return ImageResource(downloadURL: url, cacheKey: url.absoluteString)
        }
    }
}
