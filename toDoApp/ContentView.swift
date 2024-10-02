//
//  ContentView.swift
//  toDoApp
//
//  Created by Adam Makowski on 01/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAddView = false
    @State var showNoteView = false
    
    @State var notes: [Note] = [Note(title: "Note title", date: Date(), content: "aaa\naaa", type: "Note")]
    
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                
                // MARK: Background
                LinearGradient(colors: [Color(#colorLiteral(red: 0.9490087628, green: 0.7816114426, blue: 0.2484521866, alpha: 1)),Color(#colorLiteral(red: 0.9633030295, green: 0.8121976256, blue: 0.3713874221, alpha: 1)),Color(#colorLiteral(red: 0.9768833518, green: 0.8486869335, blue: 0.480963707, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.9349469543, blue: 0.618481338, alpha: 1))], startPoint: .bottom, endPoint: .topLeading)
                    .ignoresSafeArea()
                    .opacity(showAddView ? 0.0 : 1.0)
                
                ScrollView{
                    VStack{
                        
                        if notes.count == 0{
                            Text("Add your first note with \(Image(systemName: "plus.circle.fill")) button")
                                .font(.title)
                                .fontWeight(.heavy)
                                .padding(.vertical, 30)
                                .multilineTextAlignment(.center)
                            
                        }
                        
                        if notes.contains(where: {$0.type == "Note"}){
                            sectionRectangleViewNotes
                                .onTapGesture {
                                    
                                }
                        }
                        if notes.contains(where: {$0.type == "Reminder"}){
                            sectionRectangleViewReminders
                        }
                        if notes.contains(where: {$0.type == "To do"}){
                            sectionRectangleViewToDo
                        }
                    }
                }
                if showAddView{
                    Color.gray.opacity(0.8).ignoresSafeArea()
                }
                
                AddNoteView(showAddView: $showAddView, notes: $notes)
                    .cornerRadius(25)
                    .offset(
                        x: showAddView ? -UIScreen.main.bounds.minX : 0.0,
                        y: showAddView ? -UIScreen.main.bounds.midY*0.05 : 0.0)
                    .frame(
                        width: showAddView ? .infinity : 0.0,
                        height: showAddView ? UIScreen.main.bounds.height*0.85 : 0.0)
                
                
                if !showAddView {
                    addNoteButton
                }
                
            }
        }
    }
    
    var addNoteButton: some View {
        Button(action: {
            withAnimation(.spring(dampingFraction: 0.8)) {
                showAddView.toggle()
            }
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundColor(.black)
                .frame(width: 60)
        })
        .padding()
    }
    
    var sectionRectangleViewNotes: some View {
        Section(header:
                    Text("Notes")
            .bold()
            .font(.title2)
            .padding(.horizontal)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 10)
                
        ) {
            NoteRowView(notes: $notes, type: "Note")
            
        }
    }
    
    var sectionRectangleViewToDo: some View {
        Section(header:
                    Text("Things to do")
            .bold()
            .font(.title2)
            .padding(.horizontal)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 10)
                
        ) {
            NoteRowView(notes: $notes, type: "To do")
            
        }
    }
    
    var sectionRectangleViewReminders: some View {
        Section(header:
                    Text("Reminders")
            .bold()
            .font(.title2)
            .padding(.horizontal)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 10)
                
        ) {
            
            NoteRowView(notes: $notes, type: "Reminder")
            
        }
    }
}

#Preview {
    ContentView()
}
