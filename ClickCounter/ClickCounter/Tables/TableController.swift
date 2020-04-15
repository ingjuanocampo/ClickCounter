//
//  TableController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/14/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation


import UIKit

class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let favoriteThings: [CellDataSruct] = [
        CellDataSruct(title: "Apple", subTitle: "Fruit"),
        CellDataSruct(title: "Red", subTitle: "Color"),
        CellDataSruct(title: "Car" , subTitle: "Thing"),
        CellDataSruct(title: "Android", subTitle: "Operate System"),
        CellDataSruct(title: "Green" , subTitle: "Color"),
        CellDataSruct(title: "Bike" , subTitle: "Thing")
    ]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteThings.count
    }
    
    // cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingCell")
        let cellData = favoriteThings[indexPath.row]
        cell?.textLabel?.text = cellData.title
        cell?.detailTextLabel?.text = cellData.subTitle
      return cell!
    }
    
    
    struct CellDataSruct {
        let title: String
        let subTitle: String
    }
    
}
