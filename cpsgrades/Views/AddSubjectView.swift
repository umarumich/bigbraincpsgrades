//
//  AddSubjectView.swift
//  cpsgrades
//
//  Created by Michelle Tang on 2/20/23.
//

import SwiftUI

struct AddSubjectView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var percentage: Double = 0
    
    
    var body: some View {
        Form {
            Section {
                TextField("Subject name", text: $name)
                VStack {
                    Text("Percentage: \(Int(percentage))" )
                
                    Slider(value: $percentage, in: 0...100, step: 1)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addSubject(name: name, percentage: percentage, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct AddSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubjectView()
    }
}
