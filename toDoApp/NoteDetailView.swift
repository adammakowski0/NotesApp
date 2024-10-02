//
//  NoteDetailView.swift
//  toDoApp
//
//  Created by Adam Makowski on 29/09/2024.
//

import SwiftUI

struct NoteDetailView: View {
    
    var note: Note
    
    var dateFormater: DateFormatter{
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.timeStyle = .short
        return formater
    }
    
    var body: some View {
        ZStack{
            
            Color.yellow.ignoresSafeArea()
            
            VStack{
                Text(dateFormater.string(from: note.date))
                    .font(.title2)
                    .padding()
                    .fontWeight(.semibold)
                    .fontDesign(.monospaced)
                Text(note.content)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle(note.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
