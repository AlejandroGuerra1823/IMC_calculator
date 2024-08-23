//
//  ContentView.swift
//  IMC_calculator
//
//  Created by Alejandro Guerra on 20/08/24.
//

import SwiftUI

struct IMCView: View {
    @State var gender:Int = 0
    @State var height:Double = 150
    @State var age:Int = 18
    @State var weight:Int = 70
    
    
    var body: some View {
        VStack {
            HStack{
                ToggleButton(text: "Hombre", imageName: "star.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", imageName: "heart.fill", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(value: $age, text: "Edad")
                CounterButton(value: $weight, text: "Peso")
            }
            IMCCalculateButton(height: height, weight: weight)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundApp)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("IMC alejo calculator").foregroundColor(.white)
                }
            }
        
    }
}

struct ToggleButton:View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
    var body: some View {
        
        let color = if(gender == selectedGender){
            Color.backgroundSelected
        }else{
            Color.backgroundComponent
        }
        
        
        Button(action: {
            selectedGender = gender
        } ){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                InformationText(text: text)
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(color).cornerRadius(19)
        }
        
    }
}

struct InformationText:View {
    let text:String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText:View {
    let text:String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 2).accentColor(.purple).padding(.horizontal,20)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundComponent).cornerRadius(19)
    }
}

struct CounterButton:View {
    @Binding var value:Int
    let text:String
    
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(value))
            HStack{
                Button(action:{
                    if(value > 0){
                        value -= 1
                    }
                }
                ){
                    ZStack{
                        Circle().frame(width: 70,height: 70).foregroundColor(.purple)
                        Image(systemName: "minus").resizable().scaledToFit().foregroundColor(.white).frame(width: 25,height: 25)
                    }
                }
                Button(action: {
                    if(value < 100){
                        value += 1
                    }
                }){
                    ZStack{
                        Circle().frame(width: 70,height: 70).foregroundColor(.purple)
                        Image(systemName: "plus").resizable().foregroundColor(.white).frame(width: 25, height: 25)
                    }
                }
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundComponent).cornerRadius(19)
    }
}


struct IMCCalculateButton:View {
    var height:Double
    var weight:Int
    var body: some View {
        NavigationStack{
            NavigationLink(destination: {IMCResultView(userWeight: weight, userHeight:height)}){
                Text("Calcular").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100).background(.backgroundComponent).cornerRadius(19)
            }
        }
    }
}



#Preview {
    IMCView()
}
