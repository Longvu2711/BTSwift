//
//  ViewController.swift
//  TestNavbar
//
//  Created by Long Vu on 7/11/24.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  @IBAction func switchView(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
    self.navigationController?.pushViewController(vc, animated: true)
  }
}

