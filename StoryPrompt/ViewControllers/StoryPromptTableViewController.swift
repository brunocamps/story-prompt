//
//  StoryPromptTableViewController.swift
//  StoryPrompt
//
//  Created by Bruno Campos on 4/4/22.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    
    var storyPrompts = [StoryPromptEntry]()
    
    deinit {
        NotificationCenter.default.removeObserver(self )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateStoryPromptList(notification:)), name: .StoryPromptSaved, object: nil)
        
//        let storyPrompt1 = StoryPromptEntry()
//        let storyPrompt2 = StoryPromptEntry()
//        let storyPrompt3 = StoryPromptEntry()
//
//        storyPrompt1.noun = "toaster"
//        storyPrompt1.adjective = "smelly"
//        storyPrompt1.verb = "attacks"
//        storyPrompt1.number = 5
//
//        storyPrompt2.noun = "toaster"
//        storyPrompt2.adjective = "smelly"
//        storyPrompt2.verb = "attacks"
//        storyPrompt2.number = 5
//
//        storyPrompt3.noun = "toaster"
//        storyPrompt3.adjective = "smelly"
//        storyPrompt3.verb = "attacks"
//        storyPrompt3.number = 5
//
//        storyPrompts = [storyPrompt1, storyPrompt2, storyPrompt3]
        

    }

    // MARK: - Table view data source
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storyPrompts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue our first cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        cell.textLabel?.text = "Prompt \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyPrompt = storyPrompts[indexPath.row]
        performSegue(withIdentifier: "ShowStoryPrompt", sender: storyPrompt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStoryPrompt" {
            guard let storyPromptViewController = segue.destination as? StoryPromptViewController,
                  let storyPrompt = sender as? StoryPromptEntry else {
                return
            }
            storyPromptViewController.storyPrompt = storyPrompt
        }
    }
    
    @IBAction func saveStoryPrompt(unwindSegue: UIStoryboardSegue) {
//        guard let storyPromptViewController = unwindSegue.source as?
//                StoryPromptViewController,
//              let storyPrompt = storyPromptViewController.storyPrompt else {
//            return
//        }
//        // add story prompt to the array
//        storyPrompts.append(storyPrompt) // updated model
//        tableView.reloadData()
        
        
        
    }
    
    @IBAction func cancelStoryPrompt(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @objc func updateStoryPromptList(notification: Notification) {
        // cast it using a guard statement
        guard let storyPrompt = notification.object as? StoryPromptEntry else {
            return
        }
        storyPrompts.append(storyPrompt)
        tableView.reloadData()
    }
    
 


}
