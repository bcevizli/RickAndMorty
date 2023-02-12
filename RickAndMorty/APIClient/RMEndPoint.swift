//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Adem Burak Cevizli on 30.01.2023.
//

import Foundation


/// Represents unique API endpoint
@frozen enum RMEndPoint: String, CaseIterable, Hashable {
    
    /// Endpoint to get character info
    case character
    /// Endpoint to get episode info
    case episode
    /// Endpoint to get location info
    case location
}
