//
//  Home.swift
//  BannerADView (iOS)
//
//  Created by Michele Manniello on 21/11/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
//        Building Home View....
        ScrollView(.vertical, showsIndicators: false) {
            
//            Were simply placing ads for each 5 posts in between...
//            It's your choice that you use it anywhere...
            let adPlacement : Int = 5
            
            VStack(spacing: 20){
//               Since we have 25 sample Images....
//                Were using Foreach to siply iterate over images...
                ForEach(1...9,id:\.self) { index in
//                    Card View....
                    CardView(index: index)
                    
                    if (index % adPlacement) == 0{
//                        Replace your Ad Unit ID Here...
                        
                        BannerAd(unitID: "ca-app-pub-3940256099942544/2934735716")
                    }
                }
            }
            .padding()
        }
//        top Nav Bar...
        .safeAreaInset(edge: .top){
            HStack{
                Button {
                    
                } label: {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
                Spacer()

                Button {
                    
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }

            }
            .overlay(
                Text("Chatty")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
            )
            .padding(.horizontal)
            .padding(.vertical,10)
//      Blur Background...
            .background(.ultraThinMaterial)
//            Shadow...
            .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 0, y: 2)
            
        }
    }
    
    @ViewBuilder
    func CardView(index: Int) -> some View {
        VStack(alignment: .leading, spacing: 12) {
//            Post Image...
            GeometryReader{ proxy in
                let size = proxy.size
                
                Image("Post\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
            }
            .frame(height: 250)
            
//            Input Buttons...
            HStack(spacing: 15){
                ForEach(["heart","message","paperplane","bookmark"],id:\.self) { image in
                    
                    Group{
                        //                    Pushing bookmark button to last...
                        if image == "bookmark"{
                            Spacer()
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: image)
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            
//            Random Likes...
            Text("\(Int.random(in: 10...60)) Likes")
                .font(.callout)
                .fontWeight(.semibold)
            
            Text("ciao bello come va?")
                .font(.callout)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
