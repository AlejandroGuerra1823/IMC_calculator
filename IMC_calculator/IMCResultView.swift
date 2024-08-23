//
//  IMCResultView.swift
//  IMC_calculator
//
//  Created by Alejandro Guerra on 21/08/24.
//

import SwiftUI

struct IMCResultView: View {
    let userWeight:Int
    let userHeight:Double
    var body: some View {
        VStack{
            let result = calculateImc(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundApp)
    }
}

func calculateImc(weight:Int, height:Double) -> Double{
    let result = Double(weight)/((height/100)*(height/100))
    return result
}

struct InformationView:View {
    let result:Double
    var body: some View {
        
        let information = getImcResult(result: result)
        
        VStack{
            Text("Tu resultado:").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.white).padding()
            
            Text(information.0).foregroundColor(information.2).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            Text(" \(result, specifier: "%.1f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal,50)
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

func getImcResult(result:Double)->(String,String,Color){
    let title:String
    let description:String
    let color:Color
    
    switch result{
    case 0.00..<20:
        title = "peso bajo"
        description = "Estas por debajo del peso recomendado segun el IMC"
        color = .yellow
    case 20..<25:
        title = "Peso normal"
        description = "Estas en el peso recomendado segun el IMC"
        color = .green
    case 25..<40:
        title = "Sobrepeso"
        description = "Estas por encima del peso recomendado segun el IMC"
        color = .orange
    default:
        title = "ERROR"
        description = "Ha ocurrido un error"
        color = .gray
    }
    return(title,description,color)
}
