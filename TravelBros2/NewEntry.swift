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
    
    
}
