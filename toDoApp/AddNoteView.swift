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
            RoundedRectangle(cornerRadius: 20)
                .fill(.thinMaterial)

            if showAddView{
                VStack {
                    topBar
                    .padding(.horizontal)
                    
                    TextField("Title", text: $noteName)
                        .padding()
                        .background()
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                        .foregroundStyle(.secondary)
                    
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
                    Spacer()
                    
                    addNoteButton
                }
                .transition(AnyTransition.opacity.animation(.easeIn.delay(0.2)))
            }
        }.zIndex(2.0)
            .shadow(radius: 10)
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
                    .tint(.primary)
            }
            
            Spacer()
            
            Text("New \(noteType)")
                .foregroundStyle(.primary)
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
