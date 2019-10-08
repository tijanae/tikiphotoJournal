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
    
    @IBOutlet weak var photoCollection: UICollectionView!
    
    var photos = [PhotoJournalInfo]() {
        didSet {
            self.photoCollection.reloadData()
        }
    }
    
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
        loadData()
        // Do any additional setup after loading the view.
    }
    private func loadData() {
        do {
            photos = try PhotoJournalPersistenceManager.manager.getPhoto()
           } catch {
               print(error)
        }
        photoCollection.reloadData()
    }
}

extension ViewController: JournalDelegate {
    
    func actionSheet(tag: Int) {
        let optionMenu = UIAlertController.init(title: "Option", message: "Choose Option", preferredStyle: .actionSheet)
        
        let addAction = UIAlertAction(title: "Edit", style: .default) { (action) in
            let photoJournal = self.photos[tag]
            try? PhotoJournalPersistenceManager.manager.savePhoto(photo: photoJournal)
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            let deletePhotoJournal = self.photos[tag]
//            try? PhotoJournalPersistenceManager.manager.
        }
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(addAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
        
                    
    }
    
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollection.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as! mainCollectionViewCell
        let photo = photos[indexPath.row]
        cell.configureCell(photo: photo)
        return cell
    }
    
    
    
}

