//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Tia Lendor on 10/3/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var darkModeIsOn = false
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(identifier: "theSettingsVC") as! SettingsViewController
        self.navigationController?.pushViewController(settingsVC, animated: true)
        //            settingsVC.delegate = self
        settingsVC.switchOnOrOff = self.darkModeIsOn
    }
    
    @IBAction func addJournalPressed(_ sender: UIBarButtonItem) {
       
        let journalViewController = storyboard?.instantiateViewController(identifier: "JournalView") as! JournalViewController
        journalViewController.modalPresentationStyle = .currentContext
        present(journalViewController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//extension ViewController: JournalDelegate {
//    func actionSheet(tag: Int) {
//        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
//        
//        let addAction = UIAlertAction(title: "Add to Journal", style: .default) { (action) in
//            let journal = self.journal[tag]
//            try? PhotoJournalPersistenceManager.manager.savePhoto(photo: PhotoJournalInfo)
//        
//        }
//         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        optionMenu.addAction(addAction)
//        optionMenu.addAction(cancelAction)
//        self.present(optionMenu, animated: true, completion: nil)
//        
//                    
//    }
//    
//    
//}

