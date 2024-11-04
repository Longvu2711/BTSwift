//
//  ViewController.swift
//  ProjTest
//
//  Created by Long Vu on 4/11/24.
//

import UIKit

let localizeUserDefaultKey: String = "LocalizeUserDefaultKey"
var localizeDefaultLanguage: String = "en"

class ViewController: UIViewController {
    
    @IBOutlet weak var selectedLanguageLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localizeDefaultLanguage = UserDefaults.standard.string(forKey: localizeUserDefaultKey) ?? "en"
        
        selectedLanguageLabel.text = (localizeDefaultLanguage == "en") ? "English" : "Vietnamese"
        
        refreshLanguage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshLanguage()
    }
    
    private func refreshLanguage() {
        messageLabel.text = "message".translate()
    }
    
    @IBAction func languageButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Language", message: nil, preferredStyle: .actionSheet)
        
        let englishAction = UIAlertAction(title: "English", style: .default) { _ in
            self.selectedLanguageLabel.text = "English"
            print("English selected")
            
            // 
            localizeDefaultLanguage = "en"
            UserDefaults.standard.setValue(localizeDefaultLanguage, forKey: localizeUserDefaultKey)
            self.refreshLanguage()
        }
        
        let vietnameseAction = UIAlertAction(title: "Vietnamese", style: .default) { _ in
            self.selectedLanguageLabel.text = "Vietnamese"
            print("Vietnamese selected")
            
            // update translater, save user's setting.
            localizeDefaultLanguage = "vi"
            UserDefaults.standard.setValue(localizeDefaultLanguage, forKey: localizeUserDefaultKey)
            self.refreshLanguage()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(englishAction)
        alertController.addAction(vietnameseAction)
        alertController.addAction(cancelAction)
        
        // for ipad
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        present(alertController, animated: true, completion: nil)
    }
}

extension String {
    func translate() -> String {
        
        //        return NSLocalizedString(self, comment: "")

        if let path = Bundle.main.path(forResource: localizeDefaultLanguage, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        return ""
    }
}
