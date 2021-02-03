//
//  AppStoreViewController.swift
//  idus
//
//  Created by ksYoo on 2021/02/01.
//

import UIKit
import RxSwift
import SnapKit
import AlignedCollectionViewFlowLayout

class AppStoreViewController: UIViewController {
    
    lazy var screenshotCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let size = self.view.bounds.height * 0.5
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: self.view.bounds.width, height: size)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: screenshotCell)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.snp.makeConstraints { (make) in
            make.height.equalTo(size)
        }
        return cv
    }()
    lazy var fileSizeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label.font = .systemFont(ofSize: fontSize)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var filesizeView: UIView = {
        let view = UIView(frame: .zero)
        let label = UILabel(frame: .zero)
        label.text = "크기"
        label.font = .systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        view.addSubview(fileSizeLabel)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(spacing*3)
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.centerY.equalTo(view)
        }
        fileSizeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(view)
            make.centerY.equalTo(view)
        }
        return view
    }()
    lazy var releaseVersion: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label.textAlignment = .right
        label.font = .systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var moreImageView: UIImageView = {
        let imageview = UIImageView.init(image: UIImage(named: "more"))
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    lazy var clickGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        return gesture
    }()
    lazy var releaseVersionView: UIView = {
        let view = UIView(frame: .zero)
        let label = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "새로운기능"
        label.font = .systemFont(ofSize: fontSize)
        view.addSubview(label)
        view.addSubview(releaseVersion)
        view.addSubview(moreImageView)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(spacing*3)
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.centerY.equalTo(view)
        }
        moreImageView.snp.makeConstraints { (make) in
            make.right.equalTo(view)
            make.centerY.equalTo(view)
        }
        releaseVersion.snp.makeConstraints { (make) in
            make.right.equalTo(moreImageView.snp.left)
            make.centerY.equalTo(view)
        }
        view.addGestureRecognizer(clickGesture)
        return view
    }()
    lazy var releaseNoteTextView: UITextView = {
        let tv = UITextView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        tv.textAlignment = .left
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.isSelectable = false
        tv.font = .systemFont(ofSize: fontSize)
        tv.isHidden = true
        return tv
    }()
    lazy var releaseNoteSeperator: SeperatorView = {
        let sep = SeperatorView()
        sep.isHidden = true
        return sep
    }()
    lazy var releaseNoteStackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.axis = .vertical
        sv.distribution = .fill
        sv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addArrangedSubview(filesizeView)
        let sep = SeperatorView()
        sv.addArrangedSubview(sep)
        sv.addArrangedSubview(releaseVersionView)
        sv.addArrangedSubview(releaseNoteSeperator)
        sv.addArrangedSubview(releaseNoteTextView)
        sv.isLayoutMarginsRelativeArrangement = true
        sv.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        return sv
    }()
    lazy var descriptionTextView: UITextView = {
        let tv = UITextView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textColor = .black
        tv.textAlignment = .center
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.isSelectable = false
        tv.font = .systemFont(ofSize: fontSize)
        tv.textContainerInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        return tv
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: categoryCell)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        let size = self.view.bounds.width
        cv.snp.makeConstraints { (make) in
            make.height.equalTo(10)
        }
        return cv
    }()
    lazy var categoryStackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.axis = .vertical
        sv.distribution = .fill
        sv.backgroundColor = .white
        sv.spacing = spacing
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "카테고리"
        label.font = .systemFont(ofSize: fontSize)
        sv.addArrangedSubview(label)
        sv.addArrangedSubview(categoryCollectionView)
        sv.isLayoutMarginsRelativeArrangement = true
        sv.directionalLayoutMargins = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return sv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = spacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addArrangedSubview(screenshotCollectionView)
        sv.addArrangedSubview(releaseNoteStackView)
        sv.addArrangedSubview(descriptionTextView)
        sv.addArrangedSubview(categoryStackView)
        return sv
    }()
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addSubview(stackView)
        return sv
    }()
    
    let screenshotCell = "screenshotCell"
    let categoryCell = "categoryCell"
    let spacing: CGFloat = 16
    let fontSize: CGFloat = 14
    
    var viewmodel: AppStoreViewModelType
    let disposebag = DisposeBag()
    
    init(viewmodel: AppStoreViewModelType) {
        self.viewmodel = viewmodel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
        self.setAutoLayout()
        self.bindUI()
        
        viewmodel.inputs.fetchData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = categoryCollectionView.collectionViewLayout.collectionViewContentSize.height
        categoryCollectionView.snp.remakeConstraints { (make) in
            make.height.equalTo(height)
        }
        self.view.layoutIfNeeded()
    }
}
extension AppStoreViewController {
    func setView() {
        self.view.addSubview(scrollView)
    }
    func setAutoLayout() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.scrollView)
            make.width.equalTo(self.scrollView)
        }
    }
    func bindUI() {
        viewmodel.outputs.screenshotUrl
            .bind(to: screenshotCollectionView.rx.items(cellIdentifier: screenshotCell, cellType: ScreenshotCollectionViewCell.self)) {
                (row, element, cell) in
                cell.setUI(url: element)
            }.disposed(by: disposebag)
        viewmodel.outputs.category
            .bind(to: categoryCollectionView.rx.items(cellIdentifier: categoryCell, cellType: CategoryCollectionViewCell.self)) {
                (row, element, cell) in
                cell.setUI(text: element)
            }.disposed(by: disposebag)
        viewmodel.outputs.discription
            .bind(to: descriptionTextView.rx.text)
            .disposed(by: disposebag)
        viewmodel.outputs.filesizeMbyte
            .bind(to: fileSizeLabel.rx.text)
            .disposed(by: disposebag)
        viewmodel.outputs.version
            .bind(to: releaseVersion.rx.text)
            .disposed(by: disposebag)
        viewmodel.outputs.releaseNotes
            .bind(to: releaseNoteTextView.rx.text)
            .disposed(by: disposebag)
        
        clickGesture.rx.event.bind(onNext: { [weak self] recognizer in
            UIView.animate(withDuration: 0.2) {
                let isHidden = !(self?.releaseNoteTextView.isHidden ?? false)
                self?.releaseNoteTextView.isHidden = isHidden
                self?.releaseNoteSeperator.isHidden = isHidden
                self?.moreImageView.transform = isHidden ? CGAffineTransform.identity : CGAffineTransform(rotationAngle: .pi)
                self?.view.layoutIfNeeded()
            }
        }).disposed(by: disposebag)
    }
}
