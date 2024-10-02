//
//  NoteRowView.swift
//  toDoApp
//
//  Created by Adam Makowski on 29/09/2024.
//
import SwiftUI
import Foundation

struct NoteRowView : View {
    
    @Binding var notes: [Note]
    
    var type: String
    
    var dateFormater: DateFormatter{
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.timeStyle = .short
        return formater
    }
    
    var body: some View {
        
        ForEach(filterNotes(type: type)) { note in
            NavigationLink(
                destination: NoteDetailView(note: note)) {
                    
                    VStack(spacing: 15){
                        Text(note.title)
                            .font(.title)
                            .fontWeight(.heavy)
                            .tint(.primary)
                            .fontDesign(.rounded)
                            .lineLimit(1)
                        Text("\(dateFormater.string(from: note.date))")
                            .font(.caption)
                            .tint(.secondary)
                            .fontDesign(.monospaced)
                    }
                    
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .contextMenu {
                        Button {
                            // EDIT NOTE
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        
                        Button {
                            notes.removeAll { $0.id == note.id }
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                        
                    } preview: {
                        NoteDetailView(note: note)
                        
                    }
                }
        }
    }
    func filterNotes(type: String) -> [Note]{
        return notes.filter { note in
            note.type.contains(type)
        }
    }
}
