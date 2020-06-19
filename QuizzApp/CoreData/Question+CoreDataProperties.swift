//
//  Question+CoreDataProperties.swift
//  
//
//  Created by Borna on 19/06/2020.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var answears: [String]
    @NSManaged public var correctAnswear: Int64
    @NSManaged public var id: Int64
    @NSManaged public var question: String?
    
}
