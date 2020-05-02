//
//  GamePlayHistoryController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/15/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import Foundation
import UIKit



class GamePlayHistoryController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var history: Array<GameResult>? = nil

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryGameCell")!
        let gameResult = history?[indexPath.row]
        
        
        cell.textLabel?.text = gameResult?.gameStatus.getText() ?? ""
        cell.imageView?.image = UIImage(named: gameResult?.visualResourceResult ?? "")

       // If the cell has a detail label, we will put the evil scheme in.
       if let detailTextLabel = cell.detailTextLabel {
        detailTextLabel.text = gameResult?.textResult
       }

       return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        history?.count ?? 0
    }

}
