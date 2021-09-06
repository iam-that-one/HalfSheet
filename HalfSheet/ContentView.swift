//
//  ContentView.swift
//  HalfSheet
//
//  Created by Abdullah Alnutayfi on 05/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State var showHalfSheet = false
    var body: some View {
        ZStack{
         
            Color.green
                .edgesIgnoringSafeArea(.all)
          
            Button(action:{
                showHalfSheet = true
            }){
                VStack{
                Text("عرض نصف الصفحة")
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(5)
                    Spacer()
                    
                   
                }
               
            }.buttonStyle(PlainButtonStyle())
            ZStack{
            if showHalfSheet{
                VStack{
                HalfSheet(showHalfSheet: $showHalfSheet)
                    .shadow(color:.black,radius: 10)
                    .cornerRadius(20)
                
                }.transition(.move(edge: .bottom))
                .animation(.spring(response: 1, dampingFraction: 0.7, blendDuration: 1))
                .offset(y: showHalfSheet ? 400 : 0)
                .shadow(radius: 10)
            }
        }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HalfSheet :View{
    @Binding var showHalfSheet : Bool
    var body: some View{
        ZStack(alignment: .topTrailing){
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            Button(action:{
                showHalfSheet = false
            }){
                Text("إغلاق")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(Capsule())
                    .padding()
                    
            }
        }
    }
}
