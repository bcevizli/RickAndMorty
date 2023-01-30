//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Adem Burak Cevizli on 30.01.2023.
//

import Foundation


/// Object that represents a single API call
final class RMRequest {
    
///  API Constants
    private struct Constants {
        
        static let baseUrl = "https://rickandmortyapi.com/api"
        
        /// Desired Endpoint
        private let endPoint: RMEndPoint
        
        /// Path Components for API, if any
        private let pathComponents: Set<String>
        
        /// Query Arguments for API, if any
        private let queryParameters: [URLQueryItem]
        
        /// Constructed url for the API request in string format
        private var urlString: String {
            var string = Constants.baseUrl
            string += "/"
            string += endPoint.rawValue
            
            if !pathComponents.isEmpty {
                pathComponents.forEach({
                    string += "/\($0)"
                })
            }
            
            if !queryParameters.isEmpty {
                string += "?"
                // name=value&name=value
                let argumentString = queryParameters.compactMap({
                    guard let value = $0.value else { return nil }
                    return "\($0.name)=\(value)"
                }).joined(separator: "&")
                
                string += argumentString
            }
               
            return string
        }
        
        /// Computed & Constructed API url
        public var url: URL? {
            return URL(string: urlString)
        }
        
        /// Desired http method
        public let httpMethod = "GET"
        
        //        MARK: - Public
        /// Constructed request
        /// - Parameters:
        ///   - endPoint: Target endpoint
        ///   - pathComponents: Collection of path components
        ///   - queryParameters: Collection of query paramaters
        public init(endPoint: RMEndPoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem]) {
            self.endPoint = endPoint
            self.pathComponents = pathComponents
            self.queryParameters = queryParameters
        }
        
    }
   
    
   
    
    
    
    
}
