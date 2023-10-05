//
//  ContentView.swift
//  Gernal_swiftui_lektion
//
//  Created by Mariana Laic on 2023-10-05.
//

import SwiftUI

// StateObject Används när man har instansierat en klass
// Finns det StateObject så finns det ObservableObject
// ContentView äger myJournal: Journal


struct ContentView: View {
    
    @StateObject var myJournal: Journal = Journal()
    @State var showPopup: Bool = false
    
    var body: some View {
        ZStack{
            Color(.systemGray3).ignoresSafeArea()
            
             ListView(myJournal: myJournal, showPopup: $showPopup)
            
            if showPopup{
                PopupView(journal: Journal(),showPopup: $showPopup).shadow(color: .black, radius: 30)
            }
               
               
            
        }// ZStack Ends
    
       
    }//ViewEnds
    
}// Content Ends

#Preview {
    ContentView(myJournal: Journal())
}
