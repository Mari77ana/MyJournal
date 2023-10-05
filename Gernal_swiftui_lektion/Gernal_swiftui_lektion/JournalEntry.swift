//
//  JournalEntry.swift
//  Gernal_swiftui_lektion
//
//  Created by Mariana Laic on 2023-10-05.
//

import Foundation

// Identifiable när List(){} -> (en komponent i swiftUi) används för den vill ha id på föremålen i Listan som ska visas i View.
// På detta sett håller den koll. List är den för UI ingen vanliga lista
struct JournalEntry: Identifiable {
   
    var id = UUID()
    var title: String
    var description: String
    var date: Date
}
