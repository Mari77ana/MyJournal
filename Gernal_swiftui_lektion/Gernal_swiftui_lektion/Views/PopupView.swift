//
//  PopupView.swift
//  Gernal_swiftui_lektion
//
//  Created by Mariana Laic on 2023-10-05.
//


import SwiftUI

// GeometryReader{ har en VStack content -> customize it 80% and 20% from parent, do it end of VStack with .frame()}

// I PopupView vill vi ha access till våran Journal.


struct PopupView: View {
    //kopplat med $, den lyssnar på förändringar när man skriver in i textfield, där av @State
    
    @ObservedObject var journal: Journal
    @State var txtTitle: String = ""
    @State var txtDescription: String = ""
    @Binding var showPopup: Bool
  
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(){
                Text("Add Entry").font(.title).bold().padding()
                
                VStack(alignment: .leading){
                    Text("Titel")
                    TextField("Enter title", text: $txtTitle).textFieldStyle(.roundedBorder)
                    
                    Text("Desccription")
                    TextEditor(text: $txtDescription).cornerRadius(9)
                }.padding()
                
                VStack(spacing: 20){
                    Button(action: {
                        // Add more enteries
                    }, label: {
                        Text("Save").padding().background(.brown)
                            .foregroundStyle(.black).bold().cornerRadius(10)
                    })
                    Button(action: {
                        showPopup = false
                    }, label: {
                        Text("Cancel").foregroundStyle(.yellow)
                    })
                }.padding()
               
               
            //1 VStack Ends
            }.background(Color(cgColor: CGColor(red: 20/255, green: 125/255, blue: 110/255, alpha: 1)))
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.7, alignment: .center)
                
                .cornerRadius(20)
            
                .position(x: geometry.size.width/2, y: geometry.size.height/2)
        }
        
    }
    
}

#Preview {
    PopupView(journal: Journal() ,showPopup: .constant(true))
}

