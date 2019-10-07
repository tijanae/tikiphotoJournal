//
//  SettingsViewController.swift
//  PhotoJournal
//
//  Created by Tia Lendor on 10/4/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsDelegate?
    
    var switchOnOrOff = false
    
    enum DarkModeSetting: String {
        case on
        case off
    }
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        switch sender.isOn {
            case true:
                setDarkMode(setting: .on)
            case false:
                setDarkMode(setting: .off)
        
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch switchOnOrOff {
        case true:
            self.darkModeSwitch.isOn = true
        case false:
            self.darkModeSwitch.isOn = false
        }
    }
    
    private func setDarkMode(setting: DarkModeSetting) {
        switch setting {
        case .on:
            delegate?.darkModeOn()
        case .off:
            delegate?.darkModeOff()
       
        }
    }

}
