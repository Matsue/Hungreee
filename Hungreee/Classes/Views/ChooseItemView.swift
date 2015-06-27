//
//  ChooseItemView.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit
import MDCSwipeToChoose
import SDWebImage

class ChooseItemView: MDCSwipeToChooseView {
    
    let ChooseItemViewImageLabelWidth:CGFloat = 42.0;
    var item: Item!
    var informationView: UIView!
    var nameLabel: UILabel!
    var carmeraImageLabelView:ImagelabelView!
    var interestsImageLabelView: ImagelabelView!
    var friendsImageLabelView: ImagelabelView!
    
    required init(frame: CGRect, item: Item, options: MDCSwipeToChooseViewOptions) {
        super.init(frame: frame, options: options)
        
        self.item = item
        self.imageView.sd_setImageWithURL(NSURL(string: item.imageUrl))
        self.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        UIViewAutoresizing.FlexibleBottomMargin
        self.imageView.autoresizingMask = self.autoresizingMask
        constructInformationView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func constructInformationView() -> Void{
        var bottomHeight:CGFloat = 60.0
        var bottomFrame:CGRect = CGRectMake(0,
            CGRectGetHeight(bounds) - bottomHeight,
            CGRectGetWidth(bounds),
            bottomHeight);
        informationView = UIView(frame:bottomFrame)
        informationView.backgroundColor = UIColor.whiteColor()
        informationView.clipsToBounds = true
        informationView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleTopMargin
        addSubview(informationView)
        constructNameLabel()
        constructCameraImageLabelView()
        constructInterestsImageLabelView()
        constructFriendsImageLabelView()
    }
    
    func constructNameLabel() -> Void {
        var leftPadding:CGFloat = 12.0
        var topPadding:CGFloat = 17.0
        var frame:CGRect = CGRectMake(leftPadding,
            topPadding,
            floor(CGRectGetWidth(informationView.frame)/2),
            CGRectGetHeight(informationView.frame) - topPadding)
        nameLabel = UILabel(frame:frame)
        nameLabel.text = item.title
        informationView .addSubview(nameLabel)
    }
    
    func constructCameraImageLabelView() -> Void {
        var rightPadding:CGFloat = 10.0
        var image:UIImage = UIImage(named:"camera")!
        carmeraImageLabelView = buildImageLabelViewLeftOf(CGRectGetWidth(informationView.bounds), image:image, text:"0")
        informationView.addSubview(carmeraImageLabelView)
    }
    
    func constructInterestsImageLabelView() -> Void {
        var image: UIImage = UIImage(named: "book")!
        self.interestsImageLabelView = self.buildImageLabelViewLeftOf(CGRectGetMinX(self.carmeraImageLabelView.frame), image: image, text:"0")
        self.informationView.addSubview(self.interestsImageLabelView)
    }
    
    func constructFriendsImageLabelView() -> Void {
        var image:UIImage = UIImage(named:"group")!
        self.friendsImageLabelView = buildImageLabelViewLeftOf(CGRectGetMinX(self.interestsImageLabelView.frame), image:image, text:"No Friends")
        self.informationView.addSubview(self.friendsImageLabelView)
    }
    
    func buildImageLabelViewLeftOf(x:CGFloat, image:UIImage, text:String) -> ImagelabelView {
        var frame:CGRect = CGRect(x:x-ChooseItemViewImageLabelWidth, y: 0,
            width: ChooseItemViewImageLabelWidth,
            height: CGRectGetHeight(self.informationView.bounds))
        var view:ImagelabelView = ImagelabelView(frame:frame, image:image, text:text)
        view.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
        return view
    }
    
}
