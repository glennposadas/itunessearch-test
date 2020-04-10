//
//  ResultHelper.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Foundation

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
}
