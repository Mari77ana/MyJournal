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
        NavigationStack{
            ZStack{
               
                VStack{
                    Text("MY JOURNAL").bold().font(.title).padding()
                    
                    List(){
                        ForEach(myJournal.getEnteries()) { entry in //Text(entry.title)
                           clickOnEntryToNavigate(entry: entry)
                            
                        }
                    }
                    Button(action: {
                        withAnimation(.easeIn(duration: 1)) {
                            showPopup = true
                        }
                        
                    }, label: {
                        Text("Add Entry") .frame(width: 250, height: 40)
                            .background(.brown).cornerRadius(20)
                            .foregroundStyle(.black)
                    })
                }
               
           
            }// ZStack Ends
        }// NavigationStack Ends
            
            
     
    }// body: View Ends
    
   
}// ListView Ends


struct clickOnEntryToNavigate: View {
    var entry: JournalEntry// komma åt variablerna, titel

    var body: some View {
        
        NavigationLink(destination: EntriesViewScreen(entry: entry), label: {
            HStack(){
                Text("\(entry.title)")
            }
        })
        
       
    }
}

struct EntriesViewScreen: View {
    // Visa Dagboks Poster
    var entry: JournalEntry
    var body: some View {
        ZStack{
            Color(.systemGray6).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("My Entries").bold().font(.largeTitle).padding()
                Text("\(entry.title)").font(.title2).bold()
                Text("\(entry.description)").font(.title3)
                Text("\(entry.date)")
                
                Spacer()
                
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Delete Entry")
                            .frame(width: 200, height: 40)
                            .background(.brown).cornerRadius(20)
                            .foregroundStyle(.black)
                            .padding(.bottom)
                    })
              
            }
            .frame(width: 320, height: 700).background(.white)
            .cornerRadius(30)
           
         
           
          
           
        }// ZStack Ends
       
    }
}// View Ends




#Preview {
    EntriesViewScreen(entry: JournalEntry(title: "My App", description: "hjhhjhvgvgcbv n bnbhhghjghvbv hvvvnv", date: Date()))
   // ListView(myJournal: Journal(), showPopup: .constant(false))
    // showPopup skrivs med en .constant som är alltid fals till en början
   
}

// I Preview måste man skicka in all argument som ListView tar in
// I detta fall tar vi in en Journal, showPopup
// showPopup är @Binding i parametern används då en .constant(false)
