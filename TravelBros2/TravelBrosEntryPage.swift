//
//  TravelBrosEntryPage.swift
//  TravelBros2
//
//  Created by Edvard Hedlund on 2018-09-26.
//  Copyright © 2018 Bros. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class TravelBrosEntryPage: UIViewController, DiaryDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var entryText: UITextView!
    @IBOutlet weak var entryImage: UIImageView!
    
    var entryID = ""
    
    let diaryData = TravelBrosDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryData.restDel = self   // Firebase
        setDiaryData()
    }
    
    
    func setDiaryData() {
        nameLabel.text = diaryData.singleEntry.date
        entryText.text = diaryData.singleEntry.entry
        addressLabel.text = diaryData.singleEntry.address
//        let tel = restData.oneRestaurant.tel
//        callButton.setTitle(tel, for: .normal)
//        var url = restData.oneRestaurant.url
//        url = url.replacingOccurrences(of: "http://", with: "")
//        webButton.setTitle(url, for: .normal)
        
        entryImage.image = diaryData.singleEntry.img
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            if let mPage = segue.destination as? MapPage {
                mPage.entryDate = diaryData.singleEntry.date
                mPage.address = diaryData.singleEntry.address
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
