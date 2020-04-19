//
//  VillansViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/15/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation
import UIKit

class VillansViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allVillains = Villain.allVillains
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
    }
    
    
    // MARK: Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allVillains.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillainCell")!
        let villain = self.allVillains[(indexPath as NSIndexPath).row]

        // Set the name and image
        cell.textLabel?.text = villain.name
        cell.imageView?.image = UIImage(named: villain.imageName)

        // If the cell has a detail label, we will put the evil scheme in.
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = storyboard?.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
        detailController.villian = allVillains[indexPath.row]
        navigationController?.pushViewController(detailController, animated: true)
    }
}

