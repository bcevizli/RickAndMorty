//
//  RMService.swift
//  RickAndMorty
//
//  Created by Adem Burak Cevizli on 30.01.2023.
//

import Foundation


/// Primary API service object to get Rick and Morty data
final class RMService  {
    
    
    /// Shared singleton instance
    static let share = RMService()
    
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Call back with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
        
        
    }
    
}
