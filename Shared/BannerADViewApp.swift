//
//  BannerADViewApp.swift
//  Shared
//
//  Created by Michele Manniello on 21/11/21.
//

import SwiftUI

import GoogleMobileAds

@main
struct BannerADViewApp: App {
    init(){
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// From Xcode13 info.plist fire wont be shown in project navigator untill you add any keys manually in app's info...
