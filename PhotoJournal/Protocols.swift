//
//  Protocols.swift
//  PhotoJournal
//
//  Created by Tia Lendor on 10/5/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation


protocol SettingsDelegate: AnyObject {
    func darkModeOn()
    func darkModeOff()
}

protocol JournalDelegate: AnyObject {
    func actionSheet(tag: Int)
}
