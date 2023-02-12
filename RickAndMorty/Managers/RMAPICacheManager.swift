//
//  RMAPICacheManager.swift
//  RickAndMorty
//
//  Created by Adem Burak Cevizli on 8.02.2023.
//

import Foundation

/// Manages in memory session scoped API caches
final class RMAPICacheManager {
    // API URL: Data
    
    private var cacheDictionary: [RMEndPoint: NSCache<NSString, NSData>] = [:]
    
    
    init() {
        setUpCache()
    }
    
    // MARK: - Public
    
    public func cacheResponse(for endPoint: RMEndPoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[endPoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    public func setCache(for endPoint: RMEndPoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[endPoint], let url = url else {
            return 
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }
    
    // MARK: - Private
    
    private func setUpCache() {
        RMEndPoint.allCases.forEach({ endPoint in
            cacheDictionary[endPoint] = NSCache<NSString, NSData>()
     })
    }
}
