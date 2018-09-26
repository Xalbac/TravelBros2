//
//  TravelBrosListView.swift
//  TravelBros2
//
//  Created by Peter on 26.09.2018.
//  Copyright © 2018 Bros. All rights reserved.
//

import UIKit

class TravelBrosList: UIViewController, UITableViewDelegate, UITableViewDataSource, DataDelegate {
    
    var diaryData = TravelBrosDB()
    
    @IBOutlet weak var diaryTable: UITableView!
    @IBOutlet weak var loadActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryData.loadDB()
        loadActivity.isHidden = true
               diaryData.dataDel = self  // Firebase
    }
    
   override func viewWillAppear(_ animated: Bool) {
//        //        restData.restaurantArray.removeAll()
//        //        restData.loadDB()
//        //        restaurantTable.reloadData()
   }
    
    func laddaTabell() {
        diaryTable.reloadData()
        loadActivity.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryData.diaryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        let row = indexPath.row
        let diaryCell = diaryData.diaryArray[row]
        cell.entryLabel.text = diaryCell.date
//        cell.entryImage.image = restCell.thumb
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        performSegue(withIdentifier: "showEntryPage", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEntryPage" {
            if let diaryPage = segue.destination as? TravelBrosEntryPage {
                if let indx = sender as? Int {
                    let newEntry = diaryData.diaryArray[indx]
                    diaryPage.entryID = newEntry.id
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
