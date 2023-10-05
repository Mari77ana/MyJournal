//
//  Journal.swift
//  Gernal_swiftui_lektion
//
//  Created by Mariana Laic on 2023-10-05.
//

import Foundation

class Journal: ObservableObject { // Journal är inlyssnande för variablerna som kan synas
    
    // Med private exponeras inte anteckningar, vi hämtar dom istället
    @Published  private var entries: [JournalEntry] // För att anteckningar ska kunnas synas
    
    init() {
        self.entries = [JournalEntry]() // Här skapas en tom Lista av objektet JournalEntry sparas i entries.
        
        // i Listan entries läggs till 3 nya JournalEntry objekt med egenskaperna titel,description,date
        self.entries.append(JournalEntry(title: "Title1", description: "Hej", date: Date()))
        self.entries.append(JournalEntry(title: "Title2", description: "Hej", date: Date()))
        self.entries.append(JournalEntry(title: "Title3", description: "Hej", date: Date()))
    }
    
    
    // Funktionen hämtar -> returnerar anteckningar, get är en inbyggd funktion
    func getEnteries() -> [JournalEntry] {
        return entries
    }
    
}
