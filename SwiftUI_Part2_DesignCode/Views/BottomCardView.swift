//
//  BottomCardView.swift
//  SwiftUI_Part1_DesignCode
//
//  Created by Simon Mcneil on 2022-01-03.
//

import SwiftUI

struct BottomCardView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 40.0, height: 5.0)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4.0)
            
            RingView(color1: Color(hue: 0.545, saturation: 1.0, brightness: 1.0),
                     color2: Color(hue: 0.655, saturation: 1.0, brightness: 0.996),
                     width: 88, height: 88, percent: 78, show: $show)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30.0)
        .shadow(radius: 20.0)
    }
}


struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView(show: .constant(false))
    }
}
