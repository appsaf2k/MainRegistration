//
//  Login.swift
//  MainRegistration
//
//  Created by @andreev2k on 22.07.2022.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int //привязка к ContentView
    
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
