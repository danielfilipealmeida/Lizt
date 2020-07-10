//
//  Todo.swift
//  Lizt
//
//  Created by Daniel Almeida on 27/06/2020.
//  Copyright © 2020 Daniel Almeida. All rights reserved.
//

import Cocoa
import CoreData
import Foundation

class Todo: NSManagedObject {
    
    @NSManaged var text: String?
    @NSManaged var completion: Date?
    @NSManaged var creation: Date?
    
    override var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        
        let formattedDate:String = dateFormatter.string(from: self.creation!)
        let isCompletedString:String = self.completion?.compare(Date()) == ComparisonResult.orderedAscending  ? "Completed" : "Ongoing"
    
        return ("\(self.text ?? "[No text]") (Created: \(formattedDate)): \(isCompletedString)\n")
    }
}

