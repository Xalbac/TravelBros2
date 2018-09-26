//
//  TravelBrosListView.swift
//  TravelBros2
//
//  Created by Peter on 26.09.2018.
//  Copyright © 2018 Bros. All rights reserved.
//

import UIKit

class TravelBrosList: UIViewController, UITableViewDelegate, UITableViewDataSource, DataDelegate {
    
    var restData = TravelBrosDB()
    
    @IBOutlet weak var diaryTable: UITableView!
    @IBOutlet weak var loadActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        <#code#>
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        //        restData.restaurantArray.removeAll()
//        //        restData.loadDB()
//        //        restaurantTable.reloadData()
//    }
    
    func laddaTabell() {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        performSegue(withIdentifier: "showRestPage", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestPage" {
            if let restPage = segue.destination as? RestaurantPage {
                if let indx = sender as? Int {
                    let newRest = restData.restaurantArray[indx]
                    restPage.restaurantID = newRest.id
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
