//
//  QuestionViewController.swift
//  Word_lit
//
//  Created by 田嶋智洋 on 2018/04/06.
//  Copyright © 2018年 田嶋智洋. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    var isAnswered: Bool = false
    var wordArray:[Dictionary<String,String>] = []
    var shuffledWordArray:[Dictionary<String,String>] = []
    var nowNumber:Int = 0
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        //問題シャッフル
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"]
    }
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(arc4random()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        if isAnswered{
            nowNumber += 1
            answerLabel.text = ""
            if nowNumber < shuffledWordArray.count{
                questionLabel.text = shuffledWordArray[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答え合わせ", for: .normal)
            }else{
                self.performSegue(withIdentifier: "toFinisView", sender: nil)
            }
        }else{
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
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
