//
//  MainView.swift
//  Calculator
//
//  Created by Дмитрий Головащук on 31.07.2024.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
         
        ZStack {
            //background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Spacer()
                //display
                HStack{
                    Spacer()
                    Text(value)
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 27)
                }
                
                //buttons
                ForEach(buttonsArray, id: \.self){
                    row in HStack(spacing: 12){
                        ForEach(row, id: \.self){
                            item in Button {
                                self.didTap(item: item)
                            } label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: self.buttonWidth(item:item),
                                        height: self.buttonHeight()
                                    )
                                    .foregroundColor(item.buttonFontColor)
                                    .background(item.buttonColor)
                                    .font(.system(size: 35))
                                    .cornerRadius(40)
                            }
 
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
