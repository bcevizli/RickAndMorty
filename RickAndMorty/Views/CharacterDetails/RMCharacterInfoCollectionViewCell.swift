//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Adem Burak Cevizli on 5.02.2023.
//

import UIKit

class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    private func setUpConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        
        
    }
    
}
