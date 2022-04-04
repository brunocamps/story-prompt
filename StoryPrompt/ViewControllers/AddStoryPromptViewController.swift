//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Bruno Campos on 3/29/22.
//

import UIKit
import PhotosUI

class AddStoryPromptViewController: UIViewController {
    
    let storyPrompt = StoryPromptEntry()
    
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    
    @IBOutlet weak var numberSlider: UISlider!
    
    @IBAction func changeNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    @IBOutlet weak var numberLabel: UILabel!
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
        print(storyPrompt.genre)
    }
    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        if storyPrompt.isValid() {
            performSegue(withIdentifier: "StoryPrompt", sender: nil)
        } else {
            let alert = UIAlertController(title: "Invalid story prompt", message: "Please fill out all of the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: {action
                in
            })
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    @IBOutlet weak var storyPromptImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numberSlider.value = 7.5
//        storyPrompt.noun = "toaster"
//        storyPrompt.adjective = "smelly"
//        storyPrompt.verb = "burps"
        storyPrompt.number = Int(numberSlider.value)
        storyPromptImageView.isUserInteractionEnabled = true
        
        // create gesture recognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        storyPromptImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    func updateStoryPrompt() {
        // set the values of our story prompt
        storyPrompt.noun = nounTextField.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }
    
    @objc func changeImage() {
        //create our picker
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryPrompt" {
            guard let storyPromptViewController = segue.destination as?
                    StoryPromptViewController else {
                return
            }
            storyPromptViewController.storyPrompt = storyPrompt
        }
    }
}

extension AddStoryPromptViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true
    }
}

extension AddStoryPromptViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                    }
                }
            }
                }
            }
        }

