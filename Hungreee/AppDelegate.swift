//
//  AppDelegate.swift
//  Hungreee
//
//  Created by Hiroki Matsue on 6/27/15.
//  Copyright (c) 2015 Hungreee. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        var types: UIUserNotificationType = UIUserNotificationType.Badge |
            UIUserNotificationType.Alert |
            UIUserNotificationType.Sound
        
        
        var settings: UIUserNotificationSettings = UIUserNotificationSettings( forTypes: types, categories: nil )
        
        application.registerUserNotificationSettings( settings )
        application.registerForRemoteNotifications()


        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application( application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData ) {
        var characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
        
        var deviceTokenString: String = ( deviceToken.description as NSString )
            .stringByTrimmingCharactersInSet( characterSet )
            .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
        
        println( deviceTokenString )
    }
    
    //RemotePush通知取得関数
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
        println(userInfo)
        
        // 一旦ノーティフィケーション全削除
        application.cancelAllLocalNotifications()
        
        //userInfoにはサーバー側で記述した"apns_payload"が格納されている
        let json = JSON(userInfo)
        
        let state:UIApplicationState = application.applicationState;
        if (state == .Inactive || state == .Background) {
            let notification = UILocalNotification()
            notification.timeZone = NSCalendar.currentCalendar().timeZone
            notification.alertBody = json["other_data", "title"].stringValue;
            notification.hasAction = true
            application.presentLocalNotificationNow(notification)
        } else {
            print("sending notification....")
            let notification = NSNotification(
                name:"hungreeework",
                object: nil,
                userInfo:[
                    "title": json["other_data", "title"].stringValue,
                    "image_url":json["other_data", "image_url"].stringValue,
                    "lat":json["other_data", "lat"].doubleValue,
                    "lng":json["other_data", "lng"].doubleValue,
                    "review_avg":json["other_data", "review_avg"].intValue,
                    "work":json["other_data", "work"].stringValue
                ]
            )

            NSNotificationCenter.defaultCenter().postNotification(notification)

            //let queue: NSNotificationQueue = NSNotificationQueue.defaultQueue()
            //queue.enqueueNotification(notification, postingStyle: NSPostingStyle.PostASAP)
            
        }

        completionHandler(.NoData)
    }

}

