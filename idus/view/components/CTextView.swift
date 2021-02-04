//
//  CTextView.swift
//  idus
//
//  Created by ksYoo on 2021/02/04.
//

import UIKit

class CTextView: UITextView {
    let fontSize: CGFloat = 14
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isScrollEnabled = false
        self.isEditable = false
        self.isSelectable = false
        self.font = .systemFont(ofSize: fontSize)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
