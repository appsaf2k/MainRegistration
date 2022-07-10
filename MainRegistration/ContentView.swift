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
        //.preferredColorScheme(.dark)  // меняет тему для View
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



struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}



struct Login: View {
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int //привязка к ContentView и
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("LogIn")
                            .foregroundColor(self.index == 0 ? Color.white : Color.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color("Mint") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer()
                } .padding(.top, 32)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Mint"))
                        TextField("Email Adress", text: self.$email)
                    } .foregroundColor(.white)
                    
                    Divider()
                        .background(.white.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 40)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Mint"))
                        SecureField("Password", text: self.$pass)
                    } .foregroundColor(.white)
                    
                    Divider()
                        .background(.white.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 30)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        //
                    }) {
                        Text("Forget Password?")
                            .foregroundColor(.white.opacity(0.6))
                    }
                }.padding(.horizontal)
                    .padding(.top, 30)
            } .padding()
                .padding(.bottom, 65)
                .background(Color("Izumrud"))
                .clipShape(CShape())
                .contentShape(CShape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
            
            Button(action: {
                //
            }) {
                Text("LogIn")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Peach"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 0)
            }
            .offset(y: 30)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}


struct SignUp: View {
    @State var email = ""
    @State var pass = ""
    @State var rePass = ""
    @Binding var index: Int //привязка к ContentView и
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 10) {
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? Color.white : Color.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color("Izumrud") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                } .padding(.horizontal)
                    .padding(.top, 30)
                
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Izumrud"))
                        TextField("Email", text: self.$email)
                        
                    }
                    Divider()
                        .background(.black.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 40)
                
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Izumrud"))
                        SecureField("Password", text: self.$pass)
                        
                    }
                    Divider()
                        .background(.black.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Izumrud"))
                        SecureField("Repeat Password", text: self.$rePass)
                    }
                    Divider()
                        .background(.black.opacity(0.5))
                } .padding(.horizontal)
                    .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Mint"))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            
            Button(action: {
                //
            }) {
                Text("SignUp")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Peach"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 0)
            }
            .offset(y: 30)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
