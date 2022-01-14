//
//  HomeView.swift
//  SwiftUI_Part1_DesignCode
//
//  Created by Simon Mcneil on 2022-01-07.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: {
                    self.showUpdate.toggle()
                }) {
                    Image(systemName: "bell")
                        .renderingMode(.template)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            HStack(spacing: 12.0) {
                RingView(color1: Color(hue: 0.797, saturation: 1.0, brightness: 0.953),
                         color2: Color(hue: 0.55, saturation: 0.887, brightness: 1.0), width: 44, height: 44, percent: 68, showProgressRing: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left").font(.subheadline).fontWeight(.bold)
                    Text("Watched 10 minutes today").font(.caption)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 15)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: geometry.frame(in: .global).minX - 30) / -20,
                                                  axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
