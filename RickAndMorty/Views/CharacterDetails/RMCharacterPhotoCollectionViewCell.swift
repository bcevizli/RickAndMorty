//
//  RMCharacterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Adem Burak Cevizli on 5.02.2023.
//

import UIKit

final class RMCharacterPhotoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterPhotoCollectionViewCell"
    
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
    
    
    
    public func configure(with viewModel: RMCharacterPhotoCollectionViewCellViewModel) {
        
        
    }
}
