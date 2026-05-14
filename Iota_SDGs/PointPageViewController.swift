//
//  PointPageViewController.swift
//  Iota_SDGs
//
//  Created by 井手 on 2026/05/13.
//

import UIKit

class PointPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPointButtonTapped(_ sender: UIButton) {
        var account = AccountManager.shared.getCurrentAccount()
        
        let pointToAdd = sender.tag
            account.points += pointToAdd
        
        AccountManager.shared.updateAccount(age: account.age, points: account.points)
    }
    
    }
