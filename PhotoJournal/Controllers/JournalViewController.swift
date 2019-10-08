//
//  JournalViewController.swift
//  PhotoJournal
//
//  Created by Tia Lendor on 10/4/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    @IBOutlet weak var journalImage: UIImageView!
    
    @IBAction func photoLibraryPressed(_ sender: UIBarButtonItem) {
        let imagePickerViewController =  UIImagePickerController()
        imagePickerViewController.delegate = self
        present(imagePickerViewController, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
      
        caption = textView.text
        
        if imageName != ""  {
//            && photoToBeEdited == nil
            let newPhoto = PhotoJournalInfo(imageName: imageName, caption: caption, date: Date())
                DispatchQueue.global(qos: .utility).async {
                    try? PhotoJournalPersistenceManager.manager.savePhoto(photo: newPhoto)
                }
                self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    var image = UIImage() {
        didSet {
            journalImage.image = image
        }
    }
    
    var photoIndex = Int()
    var photos = [PhotoJournalInfo]()
    var imageName = ""
    var caption = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension JournalViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        

       guard let image = info[.originalImage] as? UIImage else {
                  return
              }
              
              self.image = image
              
              let imageName = UUID().uuidString
              self.imageName = imageName
              let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
              if let jpegData = image.jpegData(compressionQuality: 0.8) {
                     try? jpegData.write(to: imagePath)
                 }
              
              dismiss(animated: true, completion: nil)
       
    }
    
    
}
//extension JournalViewController: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        descriptionText = textView.text
//    }
//}

public func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
