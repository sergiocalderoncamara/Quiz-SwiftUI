//
//  QuizPlayVerticalView.swift
//  Quiz SwiftUI
//
//  Created by Sergio on 26/10/2021.
//

import SwiftUI

struct QuizPlayVerticalView: View {
    
    @Binding var respuesta: String
    @Binding var alerta: Bool
    var quizItem: QuizItem
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 5) {
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
            
            TextField("Write your answer",
                      text: $respuesta,
                      onCommit: {
                        alerta = true
                        scoresModel.check(respuesta: respuesta, quiz: quizItem)
                      }
            )
                .alert(isPresented: $alerta) {
                    let s1 = quizItem.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                    let s2 = respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    return Alert(title: Text("Result"),
                                 message: Text(s1 == s2 ? "Correct" : "Incorrect"),
                                 dismissButton: .default(Text("OK"))
                    )
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                alerta = true
                scoresModel.check(respuesta: respuesta, quiz: quizItem)
            }) {
                Text("Check")
            }
            
            Spacer()
            
            NetworkImageView(viewModel: NetworkImageViewModel(url: quizItem.attachment?.url))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .shadow(radius: 20)
                .scaledToFit()
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 5) {
                Text("Score: \(scoresModel.acertadas.count)")
                
                Spacer()
                
                Text(quizItem.author?.username ?? "anonymous")
                    .font(.subheadline)
                    .italic()
                NetworkImageView(viewModel: NetworkImageViewModel(url: quizItem.author?.photo?.url))
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
        }
        .padding()
    }
}

struct QuizPlayVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        QuizPlayVerticalView()
    }
}
