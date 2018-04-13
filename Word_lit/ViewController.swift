//
//  ViewController.swift
//  Word_lit
//
//  Created by 田嶋智洋 on 2018/04/06.
//  Copyright © 2018年 田嶋智洋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func startButtonTapped(_ sender: Any) {
        let saveData = UserDefaults.standard
        
        if let wordArray = saveData.array(forKey:"WORD"){
            if wordArray.count > 0{
                self.performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        }
        let alert: UIAlertController = UIAlertController (
            title: "単語",
            message: "まずは「単語一覧」をタップして単語を登録してください。",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
            ))
        
        self.present(alert,animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

