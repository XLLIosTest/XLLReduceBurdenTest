//
//  XLLTestedView.swift
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

import Foundation

@objc class XLLTestedCollectionViewCell: UICollectionViewCell {

    //MARK: life circle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: private methods
    func setupSubviews() {
        self.contentView.addSubview(self.dayLabel)
        self.dayLabel.mas_makeConstraints { (make: MASConstraintMaker!) in
            make.left.right()?.equalTo()(0)
            make.centerY.equalTo()(kAutoSize(size: -15))
        }
        self.contentView.addSubview(self.priceLabel)
        self.priceLabel.mas_makeConstraints { (make: MASConstraintMaker!) in
            make.left.right()?.equalTo()(0)
            make.centerY.equalTo()(kAutoSize(size: 15))
        }
    }
    
    // MARK: setter
    @objc var item: NSString! {
        didSet {
            let originPriceAttr = NSMutableAttributedString(string: "¥")
            let priceStr = item as String
            let priceAttr = NSAttributedString(string: priceStr, attributes: [NSAttributedString.Key.font: UIFont(size: kAutoSize(size: 26), style: XLLFontStyle.medium) ?? []])
            originPriceAttr.append(priceAttr)
            self.priceLabel.attributedText = originPriceAttr
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = kAutoSize(size: 8)
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = UIColor(red: 255/255.0, green: 248/255.0, blue: 239/255.0, alpha: 1.0)
    }
    
    //MARK: lazy loading
    lazy fileprivate var dayLabel: UILabel = {
        let lazyDayLabel = UILabel()
        lazyDayLabel.textColor = kRGBH(value: 0x666666)
        lazyDayLabel.textAlignment = NSTextAlignment.center
        lazyDayLabel.font = UIFont(size: kAutoSize(size: 13), style: XLLFontStyle.regular)
        lazyDayLabel.text = "一天"
        return lazyDayLabel
    }()
    lazy fileprivate var priceLabel: UILabel = {
        let lazyPriceLabel = UILabel()
        lazyPriceLabel.textColor = kRGBH(value: 0xF5440F)
        lazyPriceLabel.textAlignment = NSTextAlignment.center
        lazyPriceLabel.font = UIFont(size: kAutoSize(size: 16), style: XLLFontStyle.regular)
        return lazyPriceLabel
    }()
}

@objc public extension XLLTestedView {
    convenience init(with: ((XLLTestedView) -> Void)? = nil) {
        self.init()
        with?(self)
    }
    
    var myInfo: NSString {
        get {
            return "CoderXLL"
        }
    }
    
    //增加一些OC能够调用的减负方法..
    func setupSubviews() {
        self.addSubview(self.titleLabel)
        self.titleLabel.mas_makeConstraints { (make: MASConstraintMaker!) in
            make.top.equalTo()(kAutoSize(size: 20))
            make.centerX.equalTo()(0)
        }
        self.addSubview(self.collectionView)
        self.collectionView.mas_makeConstraints { (make: MASConstraintMaker!) in
            make.top.equalTo()(self.titleLabel.mas_bottom)?.offset()(kAutoSize(size: 35))
            make.left.right()?.equalTo()(0)
            make.width.equalTo()(kScreenWidth)
            make.bottom.equalTo()(kAutoSize(size: -70))
        }
        self.addSubview(self.sureBtn)
        self.sureBtn.mas_makeConstraints { (make: MASConstraintMaker!) in
            make.bottom.equalTo()(kAutoSize(size: -11))
            make.left.equalTo()(kAutoSize(size: 20))
            make.centerX.equalTo()(0)
            make.height.equalTo()(kAutoSize(size: 42))
        }
    }
}

extension XLLTestedView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemHeight = collectionView.frame.size.height
        return CGSize(width: itemHeight * 101 / 125.0, height: itemHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(XLLTestedCollectionViewCell.self, forCellWithReuseIdentifier: "XLLTestedCollectionViewCell")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XLLTestedCollectionViewCell", for: indexPath) as! XLLTestedCollectionViewCell
        cell.item = NSString(format: "%zd", (indexPath.item + 1) * 10)
        return cell
    }
}
