//
//  QuizPLay.swift
//  Quiz SwiftUI
//
//  Created by Sergio on 26/09/2021.
//

import SwiftUI

struct QuizPlayView: View {
    
    @State var respuesta: String = ""
    
    @State var alerta = false
    
    var quizItem: QuizItem
    
    var body: some View {
        VStack {
            HStack {
                Text(quizItem.question)
                    .font(.title)
                    .bold()
                Image(quizItem.favourite ? "star_yellow" :
                "star_grey")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                    .shadow(radius: 5)
            }
            
            Spacer()
            
            TextField("Escriba su respuesta",
                      text: $respuesta)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                alerta = true
            }, label: {
                Text("Comprobar")
            })
            
            Spacer()
            
            NetworkImageView(viewModel: NetworkImageViewModel(url: quizItem.attachment?.url))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .shadow(radius: 20)
                .scaledToFit()
            
            Spacer()
            
            HStack{

                Spacer()
                
                Text(quizItem.author?.username ?? "anonimo")
                    .font(.title3)
                NetworkImageView(viewModel: NetworkImageViewModel(url: quizItem.author?.photo?.url))
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
        }
        .padding()
    }
}

/*struct QuizPLay_Previews: PreviewProvider {
    static var previews: some View {
        
        QuizPlay()
    }
}*/
