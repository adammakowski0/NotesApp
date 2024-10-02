//
//  NoteRowView.swift
//  toDoApp
//
//  Created by Adam Makowski on 29/09/2024.
//
import SwiftUI

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
                ZStack{
                    
                    LinearGradient(colors: [Color(#colorLiteral(red: 0.1108649895, green: 0.1108649895, blue: 0.1108649895, alpha: 1)),Color(#colorLiteral(red: 0.1530328989, green: 0.1655356586, blue: 0.1836499572, alpha: 1)),Color(#colorLiteral(red: 0.2307908237, green: 0.2307908237, blue: 0.2307908237, alpha: 1)), Color(#colorLiteral(red: 0.2612757981, green: 0.2612757981, blue: 0.2612757981, alpha: 1))].shuffled(), startPoint: .topLeading, endPoint: .bottom)
                        .frame(minHeight: 100)
                        .cornerRadius(25)
                        .padding()
                        .frame(height: 150)
                        .shadow(color: .black, radius: 7, x: 0.0, y: 3)
                        .opacity(0.9)
                    LinearGradient(colors: [Color(.white), Color(.systemGray5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(minHeight: 100)
                        .cornerRadius(25)
                        .padding()
                        .shadow(color: .gray.opacity(0.5), radius: 7, x: 0.0, y: 3)
                        .opacity(0.95)
                    
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
                            
                            VStack{
                                Text(note.title)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                Text(dateFormater.string(from: note.date))
                                Text(note.content)
                            }
                            .padding()
                            .padding(.horizontal, 100)
                        }
                    
                    VStack(alignment: .leading, spacing: 15){
                        
                        
                        Text(note.title)
                            .padding(.horizontal, 40)
                            .foregroundStyle(.primary)
                            .font(.title)
                            .fontWeight(.heavy)
                            .fontWidth(.expanded)
                        Text(dateFormater.string(from: note.date))
                            .padding(.horizontal, 40)
                            .foregroundStyle(.primary)
                            .font(.subheadline)
                            .fontDesign(.monospaced)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
        }
            .accentColor(.black)
            .navigationBarBackButtonHidden(true)
        
    }
    func filterNotes(type: String) -> [Note]{
        return notes.filter { note in
            note.type.contains(type)
        }
    }
}
