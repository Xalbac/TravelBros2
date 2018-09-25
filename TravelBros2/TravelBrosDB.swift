//
//  TravelBrosDB.swift
//  TravelBros2
//
//  Created by Edvard Hedlund on 2018-09-25.
//  Copyright © 2018 Bros. All rights reserved.
//

import UIKit
import Firebase

//protocol data delegate func laddatabell

//protocol restaurantDelegate
//func set restdata

class TravelBrosDB {
    
//    var dataDel: DataDelegate?
//    var restDel: RestaurantDelegate?
    
    struct DiaryEntry {
        var id = ""
        var date = ""
        var imgUrl = ""
        var img:UIImage?
        var entry = ""
        var rating = ""
    }
    
    var DiaryArray:[DiaryEntry] = []
    var SingleEntry = DiaryEntry()

    init() {
    }
    
    func loadDB() {
        let db = Firestore.firestore()
        db.collection("Entries").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                guard let qSnapshot = querySnapshot else {return}
                for document in qSnapshot.documents {
                    var newEntry = DiaryEntry()
                    newEntry.id = document.documentID
                    newEntry.date = document.data()["date"] as? String ?? ""
//                    newRest.thumbUrl = document.data()["thumb"] as? String ?? ""
                    self.DiaryArray.append(newEntry)
                }
                
//                self.dataDel?.laddaTabell()
//                self.loadThumbs()
            }
        }
        
    }
    
    func loadSingleEntry(entryId:String) {
        let db = Firestore.firestore()
        let docRef = db.collection("Entries").document(entryId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                print(error)
            }
            if let document = document, document.exists {
                if let dataDescription = document.data() {
                    
                    self.SingleEntry.date = dataDescription["date"] as? String ?? ""
//                    self.oneRestaurant.adress = dataDescription["address"] as? String ?? ""
//                    self.oneRestaurant.imgUrl = dataDescription["img"] as? String ?? ""
//                    self.oneRestaurant.url = dataDescription["url"] as? String ?? ""
//                    self.oneRestaurant.tel = dataDescription["tel"] as? String ?? ""
//                    self.oneRestaurant.about = dataDescription["about"] as? String ?? ""
//
//                    self.loadImage(imgUrl: self.oneRestaurant.imgUrl )
                    
                }
            } else {
                print("Document does not exist")
            }
            }
    }
    
//    loadimage
    
    
//    uploadData
    
    
//    uploadImage
    
    
    
    
}
