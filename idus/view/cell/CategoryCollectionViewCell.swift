//
//  CategoryCollectionViewCell.swift
//  idus
//
//  Created by ksYoo on 2021/02/03.
//

import UIKit
import SnapKit
class CategoryCollectionViewCell: UICollectionViewCell {
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(categoryLabel)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        let spacing: CGFloat = 8
        categoryLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing))
        }
    }
    override func prepareForReuse() {
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CategoryCollectionViewCell {
    func setUI(text: String) {
        categoryLabel.text = text
    }
}
