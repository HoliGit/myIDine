//
//  ContentView.swift
//  iDine
//
//  Created by EO on 18/07/23.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name){
                        ForEach(section.items) { item in
                            NavigationLink(value:item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
            
            //navtitle attach to list, not to Navstack
            .navigationTitle("Menu")
            //no insets, from edge to edge
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
