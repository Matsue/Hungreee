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
    
    let ChooseItemButtonHorizontalPadding: CGFloat = 80.0
    let ChooseItemButtonVerticalPadding: CGFloat = 20.0
    var items: [Item] = []
    var frontCardView: ChooseItemView!
    var backCardView: ChooseItemView!
    @IBOutlet weak var nopeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadItems()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        loadItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFirstCards()
    }
    
    func suportedInterfaceOrientations() -> UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    // This is called when a user didn't fully swipe left or right.
    func viewDidCancelSwipe(view: UIView) -> Void{
        println("You couldn't decide on \(self.currentItem()?.title)");
    }
    
    // This is called then a user swipes the view fully left or right.
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void {
        layoutButtonsIfNeeded()
        
        // MDCSwipeToChooseView shows "NOPE" on swipes to the left,
        // and "LIKED" on swipes to the right.
        if(wasChosenWithDirection == MDCSwipeDirection.Left){
            println("You noped: \(self.currentItem()?.title)")
        }
        else{
            println("You liked: \(self.currentItem()?.title)")
            let itemDetailTableViewController = storyboard?.instantiateViewControllerWithIdentifier("ItemDetailTableViewControllerID") as! ItemDetailTableViewController
            itemDetailTableViewController.constructWithItem(currentItem()!)
            navigationController?.pushViewController(itemDetailTableViewController, animated: true)
        }
        
        // MDCSwipeToChooseView removes the view from the view hierarchy
        // after it is swiped (this behavior can be customized via the
        // MDCSwipeOptions class). Since the front card view is gone, we
        // move the back card to the front, and create a new back card.
        if(self.backCardView != nil){
            frontCardView = backCardView
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
    
    func defaultItems() -> [Item] {
        let items = [
            Item(
                id: "3",
                title: "Let's eat together, Humberger",
                imageUrl: "https://photos-2.dropbox.com/t/2/AAB_bO_M-WgZsfHujRr5SrLZ54OG4xV-2iFhOFicTmLJlw/12/24604400/jpeg/32x32/1/1435413600/0/2/PHOT000000000009A505_500_0.jpg/CPDd3QsgASACIAMgBCAFIAYgBygC/QWvowxvLVbd3Z4dlJaUHZdYtpt8Py_YdH9WlI0b4Giw?size=1280x960&size_mode=2",
                paybackTypes: ["review"],
                reviewScore: "5",
                lat: "35.666851",
                lng: "139.74955"
            ),
            Item(
                id: "4",
                title: "New menu \"Steak\" at Restaurant \"Meat\"",
                imageUrl: "https://photos-6.dropbox.com/t/2/AACzTvQ0gdxHyxKJ3Yo-I6Uuai0TH02EqIPVLZBUIPJn6w/12/24604400/jpeg/32x32/1/1435413600/0/2/PHOT000000000011C7B7.jpg/CPDd3QsgASACIAMgBCAFIAYgBygC/GX6OtjaZ0ImEMGWrDzxzTPT3yDs-LCYrsHOBd3bn72k?size=1280x960&size_mode=2",
                paybackTypes: ["review"],
                reviewScore: "5",
                lat: "35.666851",
                lng: "139.74955"
            ),
            Item(
                id: "2",
                title: "Restaurant \"Paella\"'s Paella",
                imageUrl: "https://photos-5.dropbox.com/t/2/AADTh4EsYtEhttnqEoZyijKENHncsWrRHuFewRbOmpxZJw/12/24604400/jpeg/32x32/1/1435413600/0/2/PHOT00000000000B9DB9.jpg/CPDd3QsgASACIAMgBCAFIAYgBygC/lBbbzT6YSo3S1gx4U8WJbNKcG0jvxjb0GnM07s2jYNc?size=1280x960&size_mode=2",
                paybackTypes: ["review"],
                reviewScore: "5",
                lat: "35.666851",
                lng: "139.74955"
            ),
            Item(
                id: "1",
                title: "Excellent pizzaaaa!!!",
                imageUrl: "https://farm6.staticflickr.com/5174/5499265262_094f6db195_q_d.jpg",
                paybackTypes: ["review"],
                reviewScore: "5",
                lat: "35.666851",
                lng: "139.74955"
            )
        ]
        
        return items
    }
    
    func popItemViewWithFrame(frame:CGRect) -> ChooseItemView? {
        if(items.count == 0) {
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
    
    func nopeFrontCardView() -> Void {
        self.frontCardView.mdc_swipe(MDCSwipeDirection.Left)
    }
    
    func likeFrontCardView() -> Void {
        self.frontCardView.mdc_swipe(MDCSwipeDirection.Right)
    }
    
    // Mark: Private
    
    private func loadItems() -> Void {
        self.items = defaultItems()
    }
    
    private func layoutButtonsIfNeeded
        () {
        if backCardView == nil {
            nopeButton.hidden = true
            likeButton.hidden = true
        }
    }
    
    private func showFirstCards() -> Void {
        // Display the first ChooseItemView in front. Users can swipe to indicate
        // whether they like or dislike the item displayed.
        frontCardView = popItemViewWithFrame(frontCardViewFrame())!
        view.addSubview(frontCardView)
        
        // Display the second ChooseItemView in back. This view controller uses
        // the MDCSwipeToChooseDelegate protocol methods to update the front and
        // back views after each user swipe.
        backCardView = popItemViewWithFrame(backCardViewFrame())!
        view.insertSubview(backCardView, belowSubview: frontCardView)
    }
    
    private func currentItem() -> Item? {
        return frontCardView.item
    }
    
    // Mark: IBActions
    
    @IBAction func nopeFrontCardView(sender: UIButton) {
        nopeFrontCardView()
    }
    
    @IBAction func likeFrontCardView(sender: UIButton) {
        likeFrontCardView()
    }
    
    @IBAction func reloadItems(sender: UIButton) {
        loadItems()
        showFirstCards()
    }
    
}
