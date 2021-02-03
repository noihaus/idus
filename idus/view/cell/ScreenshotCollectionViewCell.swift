//
//  ScreenshotCollectionViewCell.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import UIKit
import Kingfisher
import SnapKit

class ScreenshotCollectionViewCell: UICollectionViewCell {
    
    var screenshotImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(screenshotImageView)
        self.translatesAutoresizingMaskIntoConstraints = false
        screenshotImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges)
        }
    }
    override func prepareForReuse() {
        screenshotImageView.image = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ScreenshotCollectionViewCell {
    func setUI(url: URL?) {
        screenshotImageView.kf.setImage(with: url)
    }
}
