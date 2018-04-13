//
//  AddViewController.swift
//  Word_lit
//
//  Created by 田嶋智洋 on 2018/04/06.
//  Copyright © 2018年 田嶋智洋. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var englishTextField: UITextField!
    @IBOutlet weak var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String,String>] = []
    
    let saveData = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord(_ sender: Any) {
        let wordDictionary = ["english": englishTextField.text!,"japanese": japaneseTextField.text] as [String : Any]
        wordArray.append(wordDictionary as! [String : String])
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title:"保存完了",
            message:"単語の登録が完了しました",
            preferredStyle : .alert
        )
        alert.addAction(UIAlertAction(
            title :"保存完了",
            style: .default,
            handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
