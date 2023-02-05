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
    }
    /// Desired Endpoint
    private let endPoint: RMEndPoint
    
    /// Path Components for API, if any
    private let pathComponents: [String]
    
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
    public init(endPoint: RMEndPoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    /// Attempt to create request
    /// - Parameter url: URL to parse
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                  let endPointString = components[0] // Endpoint
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                
                if let rmEndpoint = RMEndPoint(rawValue: endPointString) {
                    self.init(endPoint: rmEndpoint, pathComponents: pathComponents)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endPointString = components[0]
                let queryItemsString = components[1]
//                value=name&value=name
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(name: parts[0], value: parts[1])
                })
                if let rmEndpoint = RMEndPoint(rawValue: endPointString) {
                    self.init(endPoint: rmEndpoint, queryParameters: queryItems)
                    return
                    
                }
            }
        }
            return nil
        }
    }
    
extension RMRequest {
    static let listCharactersRequest = RMRequest(endPoint: .character)
}


