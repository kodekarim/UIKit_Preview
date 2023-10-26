//
//  ViewController.swift
//  Preview
//
//  Created by abdul karim on 26/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var vlevelView: ProgressView!
    @IBOutlet weak var sStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vlevelView.borderWidth = 2
        sStepper.value = Double(vlevelView.value)
    }

    @IBAction func valueChanged(_ sender: UIStepper) {
        vlevelView.value = CGFloat(sender.value)
    }
    
}

#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateInitialViewController() as! ViewController
    vc.loadViewIfNeeded()
    vc.vlevelView.value = 0.2
    return vc
}



