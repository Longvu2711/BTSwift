//
//  ViewController.swift
//  ProjTest
//
//  Created by Long Vu on 4/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selectedLanguageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedLanguageLabel.text = "English"
    }
    
    @IBAction func languageButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Language", message: nil, preferredStyle: .actionSheet)
        
        let englishAction = UIAlertAction(title: "English", style: .default) { _ in
            self.selectedLanguageLabel.text = "English"
            print("English selected")
        }
        
        let vietnameseAction = UIAlertAction(title: "Vietnamese", style: .default) { _ in
            self.selectedLanguageLabel.text = "Vietnamese"
            print("Vietnamese selected")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(englishAction)
        alertController.addAction(vietnameseAction)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
