//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Adem Burak Cevizli on 30.01.2023.
//

import UIKit

/// Controller to show and search for characters

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endPoint: .character, queryParameters: [URLQueryItem(name: "name", value: "rick"), URLQueryItem(name: "status", value: "alive")])
        
        print(request.url)
            
        RMService.share.execute(request, expecting: RMCharacter.self) { result in
            switch result {
            case .success(let success):
                <#code#>
            case .failure(let failure):
                <#code#>
            }
        }
    

  
}
