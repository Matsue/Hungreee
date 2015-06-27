//
//  ChooseItemViewController.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit
import MDCSwipeToChoose

class ChooseItemViewController: UIViewController, MDCSwipeToChooseDelegate {
    
    var items: [Item] = []
    let ChooseItemButtonHorizontalPadding: CGFloat = 80.0
    let ChooseItemButtonVerticalPadding: CGFloat = 20.0
    var currentItem: Item!
    var frontCardView: ChooseItemView!
    var backCardView: ChooseItemView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.items = defaultItems()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.items = defaultItems()
        // Here you can init your properties
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display the first ChooseItemView in front. Users can swipe to indicate
        // whether they like or dislike the item displayed.
        self.setFrontCardViewSwift(self.popItemViewWithFrame(frontCardViewFrame())!)
        self.view.addSubview(self.frontCardView)
        
        // Display the second ChooseItemView in back. This view controller uses
        // the MDCSwipeToChooseDelegate protocol methods to update the front and
        // back views after each user swipe.
        self.backCardView = self.popItemViewWithFrame(backCardViewFrame())!
        self.view.insertSubview(self.backCardView, belowSubview: self.frontCardView)
        
        // Add buttons to programmatically swipe the view left or right.
        // See the `nopeFrontCardView` and `likeFrontCardView` methods.
        constructNopeButton()
        constructLikedButton()
    }
    
    func suportedInterfaceOrientations() -> UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    // This is called when a user didn't fully swipe left or right.
    func viewDidCancelSwipe(view: UIView) -> Void{
        println("You couldn't decide on \(self.currentItem.title)");
    }
    
    // This is called then a user swipes the view fully left or right.
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void{
        
        // MDCSwipeToChooseView shows "NOPE" on swipes to the left,
        // and "LIKED" on swipes to the right.
        if(wasChosenWithDirection == MDCSwipeDirection.Left){
            println("You noped: \(self.currentItem.title)")
        }
        else{
            println("You liked: \(self.currentItem.title)")
            let itemDetailTableViewController = storyboard?.instantiateViewControllerWithIdentifier("ItemDetailTableViewControllerID") as! ItemDetailTableViewController
            itemDetailTableViewController.constructWithItem(currentItem)
            navigationController?.pushViewController(itemDetailTableViewController, animated: true)
        }
        
        // MDCSwipeToChooseView removes the view from the view hierarchy
        // after it is swiped (this behavior can be customized via the
        // MDCSwipeOptions class). Since the front card view is gone, we
        // move the back card to the front, and create a new back card.
        if(self.backCardView != nil){
            self.setFrontCardViewSwift(self.backCardView)
        }
        
        backCardView = self.popItemViewWithFrame(self.backCardViewFrame())
        //if(true){
        // Fade the back card into view.
        if(backCardView != nil){
            self.backCardView.alpha = 0.0
            self.view.insertSubview(self.backCardView, belowSubview: self.frontCardView)
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {
                self.backCardView.alpha = 1.0
                },completion:nil)
        }
    }
    
    func setFrontCardViewSwift(frontCardView:ChooseItemView) -> Void {
        
        // Keep track of the item currently being chosen.
        // Quick and dirty, just for the purposes of this sample app.
        self.frontCardView = frontCardView
        self.currentItem = frontCardView.item
    }
    
    func defaultItems() -> [Item] {
        let items = [
            Item(
                id: "0",
                title: "Super muffine",
                imageUrl: "http://image1-1.tabelog.k-img.com/restaurant/images/Rvw/29565/320x320_square_29565024.jpg",
                paybackTypes: ["review"],
                reviewScore: "5",
                lat: "35.666851",
                lng: "139.74955"
            ),
            Item(
                id: "2",
                title: "Excellent pizzaaaa!!!",
                imageUrl: "https://farm6.staticflickr.com/5174/5499265262_094f6db195_q_d.jpg",
                paybackTypes: ["review"],
                reviewScore: "5",
                lat: "35.666851",
                lng: "139.74955"
            )
        ]
        
        return items
        //            [Item(name: "Finn", image: UIImage(named: "finn"), age: 21, sharedFriends: 3, sharedInterest: 4, photos: 5), Item(name: "Jake", image: UIImage(named: "jake"), age: 21, sharedFriends: 3, sharedInterest: 4, photos: 5), Item(name: "Fiona", image: UIImage(named: "fiona"), age: 21, sharedFriends: 3, sharedInterest: 4, photos: 5), Item(name: "P.Gumball", image: UIImage(named: "prince"), age: 21, sharedFriends: 3, sharedInterest: 4, photos: 5)]
    }
    
    func popItemViewWithFrame(frame:CGRect) -> ChooseItemView? {
        if(self.items.count == 0){
            return nil;
        }
        
        // UIView+MDCSwipeToChoose and MDCSwipeToChooseView are heavily customizable.
        // Each take an "options" argument. Here, we specify the view controller as
        // a delegate, and provide a custom callback that moves the back card view
        // based on how far the user has panned the front card view.
        var options:MDCSwipeToChooseViewOptions = MDCSwipeToChooseViewOptions()
        options.delegate = self
        //options.threshold = 160.0
        options.onPan = { state -> Void in
            if(self.backCardView != nil){
                var frame:CGRect = self.frontCardViewFrame()
                self.backCardView.frame = CGRectMake(frame.origin.x, frame.origin.y-(state.thresholdRatio * 10.0), CGRectGetWidth(frame), CGRectGetHeight(frame))
            }
        }
        
        var itemView:ChooseItemView = ChooseItemView(frame: frame, item: self.items[0], options: options)
        self.items.removeAtIndex(0)
        return itemView
    }
    
    func frontCardViewFrame() -> CGRect {
        var horizontalPadding:CGFloat = 20.0
        var topPadding:CGFloat = 60.0
        var bottomPadding:CGFloat = 200.0
        return CGRectMake(horizontalPadding,topPadding,CGRectGetWidth(self.view.frame) - (horizontalPadding * 2), CGRectGetHeight(self.view.frame) - bottomPadding)
    }
    
    func backCardViewFrame() ->CGRect {
        var frontFrame:CGRect = frontCardViewFrame()
        return CGRectMake(frontFrame.origin.x, frontFrame.origin.y + 10.0, CGRectGetWidth(frontFrame), CGRectGetHeight(frontFrame))
    }
    
    func constructNopeButton() -> Void {
        let button:UIButton =  UIButton.buttonWithType(UIButtonType.System) as! UIButton
        let image:UIImage = UIImage(named:"nope")!
        button.frame = CGRectMake(ChooseItemButtonHorizontalPadding, CGRectGetMaxY(self.backCardView.frame) + ChooseItemButtonVerticalPadding, image.size.width, image.size.height)
        button.setImage(image, forState: UIControlState.Normal)
        button.tintColor = UIColor(red: 247.0/255.0, green: 91.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        button.addTarget(self, action: "nopeFrontCardView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func constructLikedButton() -> Void {
        let button:UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        let image:UIImage = UIImage(named:"liked")!
        button.frame = CGRectMake(CGRectGetMaxX(self.view.frame) - image.size.width - ChooseItemButtonHorizontalPadding, CGRectGetMaxY(self.backCardView.frame) + ChooseItemButtonVerticalPadding, image.size.width, image.size.height)
        button.setImage(image, forState:UIControlState.Normal)
        button.tintColor = UIColor(red: 29.0/255.0, green: 245.0/255.0, blue: 106.0/255.0, alpha: 1.0)
        button.addTarget(self, action: "likeFrontCardView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    func nopeFrontCardView() -> Void {
        self.frontCardView.mdc_swipe(MDCSwipeDirection.Left)
    }
    
    func likeFrontCardView() -> Void {
        self.frontCardView.mdc_swipe(MDCSwipeDirection.Right)
    }
    
}
