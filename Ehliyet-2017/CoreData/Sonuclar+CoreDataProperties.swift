//
//  Sonuclar+CoreDataProperties.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 14.04.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//
//

import Foundation
import CoreData


extension Sonuclar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sonuclar> {
        return NSFetchRequest<Sonuclar>(entityName: "Sonuclar")
    }

    @NSManaged public var basariOrani: Int16
    @NSManaged public var dersadi: String?
    @NSManaged public var dogru: Int16
    @NSManaged public var puan: Float
    @NSManaged public var saat: String?
    @NSManaged public var tarih: String?
    @NSManaged public var x: Float
    @NSManaged public var yanlis: Int16

}
