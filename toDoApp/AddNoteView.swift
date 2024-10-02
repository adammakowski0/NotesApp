//
//  AddNoteView.swift
//  toDoApp
//
//  Created by Adam Makowski on 29/09/2024.
//

import SwiftUI

struct AddNoteView : View {
    
    @Binding var showAddView: Bool
    @Binding var notes: [Note]
    @State var noteDate: Date = Date()
    @State var noteName = ""
    @State var noteType = "Note"
    @State var noteContent = ""
    
    var body: some View {
        
        ZStack{
            
            // MARK: Background
            LinearGradient(colors: [Color(#colorLiteral(red: 0.1108649895, green: 0.1108649895, blue: 0.1108649895, alpha: 1)),Color(#colorLiteral(red: 0.1530328989, green: 0.1655356586, blue: 0.1836499572, alpha: 1)),Color(#colorLiteral(red: 0.2307908237, green: 0.2307908237, blue: 0.2307908237, alpha: 1)), Color(#colorLiteral(red: 0.2612757981, green: 0.2612757981, blue: 0.2612757981, alpha: 1))], startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
            
            if showAddView{
                VStack {
                    topBar
                    .padding(.horizontal)
                    
                    TextField("Title", text: $noteName)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                    
                    Picker(selection: $noteType) {
                        Text("Note").tag("Note")
                        Text("Reminder").tag("Reminder")
                        Text("To do").tag("To do")
                    } label: {
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    TextEditor(text: $noteContent)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .textEditorStyle(AutomaticTextEditorStyle())
                    Spacer()
                    DatePicker("Select Date", selection: $noteDate, displayedComponents: [.date])
                        .padding()
                        .padding(.horizontal, 50)
                        .background(.placeholder)
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                        .foregroundStyle(.gray)
                    Spacer()
                    
                    addNoteButton
                }
                .transition(AnyTransition.opacity.animation(.easeIn.delay(0.2)))
            }
        }.zIndex(2.0)
    }
    
    var topBar: some View {
        HStack {
            Button {
                noteName = ""
                noteDate = .now
                
                withAnimation(.spring(dampingFraction: 0.8)) {
                    showAddView.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            Text("New \(noteType)")
                .foregroundStyle(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .frame(alignment: .bottom)
                .padding()
            Spacer()
        }
    }
    
    var addNoteButton: some View{
        Button(action: {
            
            // ADD NOTE
            let note = Note(title: noteName, date: noteDate, content: noteContent, type: noteType)
            notes.append(note)
            
            noteName = ""
            noteDate = .now
            
            withAnimation(.spring(dampingFraction: 0.8)) {
                showAddView.toggle()
            }
            
        }, label: {
            Text("Add Note")
                .font(.title)
                .bold()
                .padding()
                .padding(.horizontal,30)
                .background(.black)
                .foregroundStyle(.white)
                .cornerRadius(10)
        })
        .padding()
    }
}

#Preview {
    ContentView(showAddView: true)
}
