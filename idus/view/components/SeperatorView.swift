//
//  SeperatorView.swift
//  idus
//
//  Created by ksYoo on 2021/02/03.
//

import UIKit
import SnapKit
class SeperatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints { (make) in
            make.height.equalTo(1)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
