//
//  BannerAd.swift
//  BannerADView (iOS)
//
//  Created by Michele Manniello on 21/11/21.
//


//Imeplentare AdMob...
//Installare AdMob SDK con CocoaPods...
//Inizializzare AdMob In SwiftUI App
//Update Info Plist con AdMobID
//Cambiare il semplice AdMob ID con il proprio AdMob APP ID
//Integrate AdMob UIKIt view into SwiftUI view...
//Cambiare l'id di esempio con il proprio ID 

import SwiftUI
import GoogleMobileAds

struct BannerAd: UIViewRepresentable {
    
    var unitID: String
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> GADBannerView {
        
        let adView = GADBannerView(adSize: kGADAdSizeBanner)
        
        adView.adUnitID = unitID
        adView.rootViewController = UIApplication.shared.getRootViewController()
        adView.delegate = context.coordinator
        adView.load(GADRequest())
        
        return adView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
        
    }
    
    class Coordinator: NSObject,GADBannerViewDelegate {
        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
          print("bannerViewDidReceiveAd")
        }

        func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
          print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
        }

        func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
          print("bannerViewDidRecordImpression")
        }

        func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
          print("bannerViewWillPresentScreen")
        }

        func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
          print("bannerViewWillDIsmissScreen")
        }

        func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
          print("bannerViewDidDismissScreen")
        }
    }
}

// Extending Application to get RootView...
extension UIApplication{
    func getRootViewController() -> UIViewController {
        guard let screen = self.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else { return .init() }
        
        return root
    }
}
