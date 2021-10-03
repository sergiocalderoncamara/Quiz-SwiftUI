//
//  QuizRowView.swift
//  Quiz SwiftUI
//
//  Created by Sergio on 23/09/2021.
//

import SwiftUI

struct QuizRowView: View {
    
    var quizItem: QuizItem
    
    var body: some View {
        HStack {
            
            NetworkImageView(viewModel: NetworkImageViewModel(url: quizItem.attachment?.url))
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 6)
                .overlay(Circle().stroke(Color.white))
            
            Text(quizItem.question)
                .bold()
                .font(.title3)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                HStack {
                    Text(quizItem.author?.username ?? "anonymous")
                        .font(.subheadline)
                        .italic()
                    NetworkImageView(viewModel: NetworkImageViewModel(url: quizItem.author?.photo?.url))
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                
                Image(quizItem.favourite ? "star_yellow" :
                "star_grey")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                    .shadow(radius: 5)
            }
            
        }
    }
}

/*struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuizRowView()
    }
}*/
