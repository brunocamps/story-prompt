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
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        storyPrompt.noun = "toaster"
//        storyPrompt.verb = "swim"
//        storyPrompt.adjective = "smelly"
//        storyPrompt.number = 7
        
        storyPromptTextView.text = storyPrompt?.description
        


    }
    
    // containing nav controller
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

}
