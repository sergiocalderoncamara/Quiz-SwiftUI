//
//  Scoresmodel.swift
//  Quiz SwiftUI
//
//  Created by Sergio on 30/09/2021.
//

import Foundation

class ScoresModel : ObservableObject {
    
    //Los datos
    @Published private(set) var acertadas: Set<Int> = []
    @Published private(set) var record: Set<Int> = []
    private let defaults = UserDefaults.standard
    
    init() {
        if let auxRecord = defaults.object(forKey: "record") as? [Int] {
            record = Set(auxRecord)
        }
    }
    
    func check(respuesta: String, quiz: QuizItem) {
        
        let s1 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let s2 = respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if s1 == s2 {
            acertadas.insert(quiz.id)
            record.insert(quiz.id)
            defaults.set(Array<Int>(record), forKey: "record")
            defaults.synchronize()
        }
    }
}
