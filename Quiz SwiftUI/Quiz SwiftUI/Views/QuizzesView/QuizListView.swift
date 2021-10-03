//
//  ContentView.swift
//  Quiz SwiftUI
//
//  Created by Sergio on 23/09/2021.
//

import SwiftUI

struct QuizListView: View {
    
    @EnvironmentObject var quizzesModel: QuizzesModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(quizzesModel.quizzes) { quiz in
                    NavigationLink(destination: QuizPlayView(quizItem: quiz)) {
                        QuizRowView(quizItem: quiz)
                    }
                }
            }
            .padding()
            .onAppear{
                quizzesModel.load()
            }
            .navigationTitle("P1 Quiz SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView()
    }
}
