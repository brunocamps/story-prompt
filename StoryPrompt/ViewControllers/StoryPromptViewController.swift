//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Bruno Campos on 3/30/22.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPromptTextView: UITextView!
    
    
    var storyPrompt: StoryPromptEntry?
    var isNewStoryPrompt = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        storyPrompt.noun = "toaster"
//        storyPrompt.verb = "swim"
//        storyPrompt.adjective = "smelly"
//        storyPrompt.number = 7
        
        storyPromptTextView.text = storyPrompt?.description
        
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
        }
        


    }
    
    // containing nav controller
    // as we'll be hiding our navigation bar, comment out viewWillAppear and viewWillDisappear
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    @objc func cancelStoryPrompt() {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPrompt() {
        NotificationCenter.default.post(name: .StoryPromptSaved, object: storyPrompt)
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    
}

extension Notification.Name {
    static let StoryPromptSaved = Notification.Name("StoryPromptSave")
}
