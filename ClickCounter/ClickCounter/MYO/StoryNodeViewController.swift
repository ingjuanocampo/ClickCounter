//
//  StoryNodeViewController.swift
//  ClickCounter
//
//  Created by juan ocampo on 4/19/20.
//  Copyright © 2020 juan ocampo. All rights reserved.
//

import UIKit

// MARK: - StoryNodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class StoryNodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    var storyNode: StoryNode!
    
    // MARK: Outlets
    
    @IBOutlet weak var adventureImageView: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restartButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the image
        if let imageName = storyNode.imageName {
            self.adventureImageView.image = UIImage(named: imageName)
        }
        
        // Set the message text
        self.messageTextView.text = storyNode.message
        
        // Hide the restart button if there are choices to be made
        restartButton.isHidden = storyNode.promptCount() > 0
    }
    
    // MARK: Table Placeholder Implementation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyNodeController = self.storyboard!.instantiateViewController(withIdentifier: "StoryNodeViewController")as! StoryNodeViewController
        
        storyNodeController.storyNode = storyNode.storyNodeForIndex(index: indexPath.row)
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(storyNodeController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Return the number of prompts in the storyNode (The 2 is just a place holder)
        return storyNode?.promptCount() ?? 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Dequeue a cell and populate it with text from the correct prompt.
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!

        cell.textLabel!.text = storyNode?.promptForIndex(indexPath.row)
        
        return cell
    }

    // MARK: Actions
    
    @IBAction func restartStory() {
        let controller = self.navigationController!.viewControllers[1]
        let _ = self.navigationController?.popToViewController(controller, animated: true)
    }
}
