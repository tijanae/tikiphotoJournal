//
//  photoPersistenceHelper.swift
//  PhotoJournal
//
//  Created by Tia Lendor on 10/6/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation


struct PhotoJournalPersistenceManager {
    private init() {}
    static let manager = PhotoJournalPersistenceManager()
    
    
       private let persistenceHelper = PersistenceHelper<PhotoJournalInfo>(fileName: "Journal.plist")
    
    
    func savePhoto(photo: PhotoJournalInfo) throws {
        try persistenceHelper.save(newElement: photo)
        
    }
    
    func getPhoto() throws -> [PhotoJournalInfo] {
        return try persistenceHelper.getObjects()
    }
    
   
    
    
}
