//
//  DataController.swift
//  cpsgrades
//
//  Created by Michelle Tang on 2/19/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Subject")
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to laod the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context:NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved if you have an A congrats if not ur fucked")
        } catch {
            print("Data not saved, maybe your grades were so bad you broke the app :(")
        }
        
        }
    func addSubject (name: String, percentage: Double, context: NSManagedObjectContext) {
        let subject = Subject(context: context)
        subject.id = UUID()
        subject.date = Date()
        subject.subject = name
        subject.percentage = percentage
        
        save(context: context)
    }
    
    func editSubject(subject: Subject, name: String, percentage: Double, context: NSManagedObjectContext) {
        subject.date = Date()
        subject.subject = name
        subject.percentage = percentage
        
        save(context: context)
    }
    
    }
