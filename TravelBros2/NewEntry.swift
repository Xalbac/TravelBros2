//
//  NewEntry.swift
//  TravelBros2
//
//  Created by Edvard Hedlund on 2018-09-26.
//  Copyright © 2018 Bros. All rights reserved.
//

import UIKit
import Firebase

class NewEntry: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var entryField: UITextField!
    @IBOutlet weak var entryImage: UIImageView!
    
    
    let diaryData = TravelBrosDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sparaData() {
        
        diaryData.singleEntry.date = dateField.text ?? ""
        diaryData.singleEntry.address = addressField.text ?? ""
        diaryData.singleEntry.entry = entryField.text ?? ""
        
        if entryImage.image != nil {
            diaryData.singleEntry.img = entryImage.image
        }
        
        diaryData.uploadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func newPicture(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if sender.tag == 1 { imagePicker.sourceType = .camera }
        else if sender.tag == 2 { imagePicker.sourceType = .photoLibrary }
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        entryImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        entryImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        dismiss(animated:true, completion: nil)
//    }
