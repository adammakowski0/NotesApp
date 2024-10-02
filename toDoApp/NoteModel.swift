//
//  NoteModel.swift
//  toDoApp
//
//  Created by Adam Makowski on 29/09/2024.
//

import Foundation

struct Note: Identifiable{
    
    var title: String
    var date: Date
    var id = UUID()
    var content: String
    var type: String
}
