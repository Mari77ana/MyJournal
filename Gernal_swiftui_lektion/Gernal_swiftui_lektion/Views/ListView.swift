//
//  ListView.swift
//  Gernal_swiftui_lektion
//
//  Created by Mariana Laic on 2023-10-05.
//


// När man skapar filer med Views -> import SwiftUI
import SwiftUI

struct ListView: View{
    
    @StateObject var myJournal = Journal()
    @Binding var showPopup: Bool
    
    var body: some View{
        ZStack{
            
            VStack{
                Text("MY JOURNAL").bold().font(.title).padding()
                
                List(){
                    ForEach(myJournal.getEnteries()){
                        entry in Text(entry.title)
                        
                    }
                }
                Button(action: {
                    withAnimation(.easeIn(duration: 1)) {
                        showPopup = true
                    }
                   
                }, label: {
                    Text("Add Entry").padding().background(.brown).foregroundStyle(.black).cornerRadius(8)
                })
            }
           // PopupView()
            
        }// ZStack Ends
        
        
        
    }// body: View Ends
    
    
}// ListView Ends

#Preview {
    ListView(myJournal: Journal(), showPopup: .constant(false))
    // showPopup skrivs med en .constant som är alltid fals till en början
   
}

// I Preview måste man skicka in all argument som ListView tar in
// I detta fall tar vi in en Journal, showPopup
// showPopup är @Binding i parametern används då en .constant(false)
