//
//  Quiz_SwiftUIApp.swift
//  Quiz SwiftUI
//
//  Created by Sergio on 23/09/2021.
//

import SwiftUI

@main
struct Quiz_SwiftUIApp: App {
    
    let quizzesModel = QuizzesModel()
    let scoresModel = ScoresModel()
    
    var body: some Scene {
        WindowGroup {
            QuizListView()
                .environmentObject(quizzesModel)
                .environmentObject(scoresModel)
        }
    }
}
