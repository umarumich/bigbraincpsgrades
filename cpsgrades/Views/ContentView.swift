//
//  ContentView.swift
//  cpsgrades
//
//  Created by Michelle Tang on 2/19/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managaedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var subject: FetchedResults<Subject>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalPercentageToday()))  You have dropped out of school.")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List {
                    ForEach(subject) { subject in
                        NavigationLink(destination: Text("\(subject.percentage)")) {
                            HStack {
                                VStack (alignment: .leading, spacing: 6) {
                                    Text (subject.subject!)
                                        .bold()
                                    
                                    Text("\(Int(subject.percentage))") + Text (" percentage").foregroundColor(.red )
                                }
                                Spacer()
                                Text(calcTimeSince(date: subject.date!))
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deletedSubject)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iGrades")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Subject", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddSubjectView()
                
            }
        }
        .navigationViewStyle(.stack)
    }
    private func deletedSubject(offsets: IndexSet) {
        
        
    }
    private func totalPercentageToday() -> Double {
        return 0.0
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
