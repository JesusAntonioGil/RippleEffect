//
//  ContentView.swift
//  RippleEffect
//
//  Created by Jesus Antonio Gil on 16/2/25.
//

import SwiftUI


struct ContentView: View {
    @State private var ripple = Ripple(diameter: 10, isFadding: false)
    
    var body: some View {
        ZStack {
            RippleView(ripple: $ripple)
                .opacity(ripple.isFadding ? 0.1 : 1)
            
            Rectangle()
                .fill(.clear)
        }
        .onAppear {
            withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                ripple.isFadding = true
                ripple.diameter = 300
            }
        }
        .background(Color.init(red: 229/255, green: 229/255, blue: 239/255))
        .edgesIgnoringSafeArea(.all)
    }
}


struct Ripple {
    var diameter: CGFloat
    var isFadding: Bool
}


struct RippleView: View {
    @Binding var ripple: Ripple
    
    
    var body: some View {
        Circle()
            .fill(Color.init(red: 225/255, green: 225/255, blue: 235/255))
            .frame(width: ripple.diameter, height: ripple.diameter)
            .overlay {
                Circle()
                    .stroke(.gray, lineWidth: 10)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
            }
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 10)
                    .blur(radius: 4)
                    .offset(x: -2, y: -2)
            }
    }
}


#Preview {
    ContentView()
}
