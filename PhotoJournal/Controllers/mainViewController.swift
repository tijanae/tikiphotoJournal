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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

