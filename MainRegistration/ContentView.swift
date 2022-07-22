//
//  ContentView.swift
//  MainRegistration
//
//  Created by @andreev2k on 10.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    @State private var scale: CGFloat = 1
    
    var body: some View {
        GeometryReader { _ in
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 80, height: 70)
                    .foregroundColor(Color("Peach"))
                    .shadow(color: .black, radius: 5, x: 5, y: 0)
                    .scaleEffect(scale)
                    .onAppear {
                        let base = Animation.easeInOut(duration: 2)
                        let repeated = base
                            .repeatForever(autoreverses: true)
                        return withAnimation(repeated) {
                            self.scale = 0.8
                        } }
                Text("Fly with US")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                }
                Spacer()
                
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color("Izumrud"))
                        .frame(height: 1)
                    
                    Text("OR")
                    Rectangle()
                        .fill(Color("Izumrud"))
                        .frame(height: 1)
                    
                } .padding(.horizontal, 35)
                    .padding(.top, 20)
                
                HStack(spacing: 40) {
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "applelogo")
                            .resizable()
                            .frame(width: 40, height: 50)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "envelope.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    }
                }.padding()
            }.padding(.vertical)
                .padding()
        }.background(.thinMaterial)
        //.preferredColorScheme(.dark)  // меняет тему
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.portrait)
    }
}
