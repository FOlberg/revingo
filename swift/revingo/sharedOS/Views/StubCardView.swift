///**
/**
    revingo
    Copyright (C) 2022  Frederik Olberg, Leonard Husmann 

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 
 Design Inspired by:
 
 https://gist.github.com/mageshsridhar/556fe1c303ba7aed4d26d0cc82e98a27
 
*/

import SwiftUI

struct StubCardView: View {
    @State private var animate = false
    
    /**
     Add multilanguage support
     */
    
    let descriptionText: LocalizedStringKey  = "cardDescritionText"
    let cardHeaderTopLabel: LocalizedStringKey = "cardHeaderTopLabel"
    let cardHeaderCenterLabel: LocalizedStringKey = "cardHeaderCenterLabel"
    let cardHeaderBottomLabel: LocalizedStringKey = "cardHeaderBottomLabel"

    fileprivate func TopLeftText() -> some View {
        return HStack {
            VStack(alignment:.leading,spacing:15) {
                HStack(spacing:0) {
                    Image(systemName: "hand.tap.fill")
                        .font(.title2)
                    Text(cardHeaderTopLabel)
                        .font(.title)
                        .padding(.leading)
                }
                Text(cardHeaderCenterLabel)
                    .bold()
                    .font(.system(size: 40, weight: .heavy))
                Text(cardHeaderBottomLabel)
                    .font(.system(size: 40, weight: .regular))
                    .padding(.vertical,-25)
            }
            Spacer()
        }.padding().padding()
    }
    
    fileprivate func BottomDescriptionText() -> some View {
        return Text(descriptionText)
            .font(.system(size: 14))
            .padding()
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .multilineTextAlignment(.center)
    }
    
    fileprivate func CardTextView() -> some View {
        return VStack() {
            TopLeftText()
            Spacer()
            BottomDescriptionText()
        }.foregroundColor(.white)
    }
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .fill(.red)
                    .blur(radius: 10)
                    .offset(x:animate ? 10 : 130,y:animate ? 20 : 160)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink)
                    .blur(radius: 20)
                    .offset(x: animate ? -120 : 10,y :animate ? -100 : 20)
                    .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
                Rectangle()
                    .fill(.green)
                    .blur(radius: 30)
                    .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
                    .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
                Capsule()
                    .fill(.mint)
                    .blur(radius: 40)
                    .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
                    .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
                Circle()
                    .fill(.blue)
                    .blur(radius: 50)
                    .offset(x: animate ? 90 : -10,y:animate ? -90 : 40)
                    .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.teal)
                    .blur(radius: 60)
                    .offset(x: animate ? -90 : 40,y:animate ? 90 : -20)
                    .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
                Capsule()
                    .fill(.yellow)
                    .blur(radius: 70)
                    .offset(x: animate ? 10 : 170 ,y:animate ? 0 : -150)
                    .opacity(0.4)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
                
                CardTextView()
                
            }.frame(width: UIScreen.main.bounds.width - 60,height: UIScreen.main.bounds.height/2)
                .clipped()
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.25), radius: 25, x: 0, y: 20)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                        animate.toggle()
                    }
                }
            Spacer()
            Image("revingo_logo")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 14)
                .padding()
        }
    }
}

struct Fun_Previews: PreviewProvider {
    static var previews: some View {
        StubCardView()
    }
}
