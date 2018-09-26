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
protocol DataDelegate {
    func laddaTabell()
}

//protocol restaurantDelegate
//func set restdata

protocol DiaryDelegate {
    func setDiaryData()
    //    func setRestData(description:[String:Any])
    //    func setRestImg(img:UIImage)
}

class TravelBrosDB {
    
    var dataDel: DataDelegate?
    var restDel: DiaryDelegate?
    
    struct DiaryEntry {
        var id = ""
        var date = ""
        var imgUrl = ""
        var img:UIImage?
        var entry = ""
        var rating = ""
    }
    
    var diaryArray:[DiaryEntry] = []
    var singleEntry = DiaryEntry()

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
                    self.diaryArray.append(newEntry)
                }
                
//                self.dataDel?.laddaTabell()
//                self.loadThumbs()
            }
        }
        
    }
    
//    func loadThumbs() {
//        let storageRef = Storage.storage().reference()
//        for (index,var newRest) in restaurantArray.enumerated() {
//            let imgRef = storageRef.child(newRest.thumbUrl )
//            imgRef.getData(maxSize: 1024*1024) { data, error in
//                if let error = error {
//                    print(error)
//                } else {
//                    if let thumbData = data {
//                        newRest.thumb = UIImage(data: thumbData)
//                        self.restaurantArray[index] = newRest
//                    }
//                }
//                self.dataDel?.laddaTabell()
//            }
//        }
//    }
    
    func loadSingleEntry(entryId:String) {
        let db = Firestore.firestore()
        let docRef = db.collection("Entries").document(entryId)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                print(error)
            }
            if let document = document, document.exists {
                if let dataDescription = document.data() {
                    
                    self.singleEntry.date = dataDescription["date"] as? String ?? ""
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
    func loadImage(imgUrl:String) {
        let storageRef = Storage.storage().reference()
        let imgRef = storageRef.child(imgUrl)
        imgRef.getData(maxSize: 1024*1024) { data, error in
            if let error = error {
                print(error)
            } else {
                if let imgData = data {
                    if let diaryImg = UIImage(data: imgData){
                        self.singleEntry.img = diaryImg
//                        self.restDel?.setRestData()
                    }
                }
                
            }
            
            
        }
    }
    
    
//    uploadData
    func uploadData() {
        var imgName = singleEntry.date.replacingOccurrences(of: " ", with: "_")
        imgName = imgName.replacingOccurrences(of: "&", with: "")
        imgName = imgName.lowercased()
        
        let db = Firestore.firestore()
        var dataDict = [
            "date": singleEntry.date,
            "entry": singleEntry.entry
        ]
        
        if singleEntry.img != nil {
            dataDict["img"] = imgName + ".jpg"
//            dataDict["thumb"] = imgName + "_thumb.jpg"
        }
        
        db.collection("Entries").document().setData(dataDict) { err in
            if let err = err {
                print("Error: \(err)")
            } else {
                print("Dokument sparat")
//                if self.singleEntry.img != nil { self.uploadImage(imgName: imgName) }
            }
        }
    }
    
    
//    uploadImage
    func uploadImage(imgName:String) {
        if let image = singleEntry.img {
            UIGraphicsBeginImageContext(CGSize(width: 800, height: 475))
            let ratio = Double(image.size.width/image.size.height)
            let scaleWidth = 880.0
            let scaleHeight = 880.0/ratio
            let offsetX = 0.0
            let offsetY = (scaleHeight-475)/2.0
            image.draw(in: CGRect(x: -offsetX, y: -offsetY, width: scaleWidth, height: scaleHeight))
            let largeImg = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            if let largeImg = largeImg, let jpegData = largeImg.jpegData(compressionQuality: 0.7) {
                let storageRef = Storage.storage().reference()
                let imgRef = storageRef.child(imgName+".jpg")
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                
                imgRef.putData(jpegData, metadata: metadata) { (metadata, error) in
                    guard metadata != nil else {
                        print(error!)
                        return
                    }
                    print("image uploaded")
//                    self.uploadThumb(imgName: imgName)
                }
            }
            
            
        }
        
    }
    
//    func uploadThumb(imgName:String) {
//        if let image = oneRestaurant.img {
//            UIGraphicsBeginImageContext(CGSize(width: 80, height: 80))
//            let ratio = Double(image.size.width/image.size.height)
//            let scaleWidth = ratio*80.0
//            let scaleHeight = 80.0
//            let offsetX = (scaleWidth-80)/2.0
//            let offsetY = 0.0
//            image.draw(in: CGRect(x: -offsetX, y: -offsetY, width: scaleWidth, height: scaleHeight))
//
//            let thumb = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//
//            if let thumb = thumb, let jpegData = UIImageJPEGRepresentation(thumb, 0.7) {
//                let storageRef = Storage.storage().reference()
//                let imgRef = storageRef.child(imgName+"_thumb.jpg")
//
//                let metadata = StorageMetadata()
//                metadata.contentType = "image/jpeg"
//
//                imgRef.putData(jpegData, metadata: metadata) { (metadata, error) in
//                    guard metadata != nil else {
//                        print(error!)
//                        return
//                    }
//                    print("thumb uploaded")
//                }
//            }
//        }
//    }
    
}
