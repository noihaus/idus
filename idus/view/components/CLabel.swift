//
//  CLabel.swift
//  idus
//
//  Created by ksYoo on 2021/02/04.
//

import UIKit

class CLabel: UILabel {
    let fontSize: CGFloat = 14
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = .systemFont(ofSize: fontSize)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
