//
//  NoItemsView.swift
//  TodoList
//
//  Created by ronik on 1/27/24.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate = false
    let secondaryAccentColor = Color("SecondaryAccentColor")    // Maroon
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Let's Get Started!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("You are ready to add your first item to this list!")
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something!")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(animate ? secondaryAccentColor :  Color.accentColor)
                            .cornerRadius(10)
                })
//                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.5) :  Color.accentColor.opacity(0.5),
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                    x: 0,
                    y: 20
                )
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
