//
//  ContentView.swift
//  Quiz SwiftUI
//
//  Created by Sergio on 23/09/2021.
//

import SwiftUI

struct QuizListView: View {
    
    @EnvironmentObject var quizzesModel: QuizzesModel
    @EnvironmentObject var scoresModel: ScoresModel
    @State var show: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Filtar Preguntas Acertadas", isOn: $show)       //Filtro de acertadadas
                ForEach(quizzesModel.quizzes) { quiz in
                    if !(show && scoresModel.acertadas.contains(quiz.id)) {
                        NavigationLink(destination: QuizPlayView(quizItem: quiz)) {
                            QuizRowView(quizItem: quiz)
                        }
                    }
                }
            }
            .padding()
            .onAppear{
                quizzesModel.load()
            }
            .navigationTitle("P1 Quiz SwiftUI")
            .navigationBarItems(leading: Text("Record: \(scoresModel.record.count)"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView()
    }
}
