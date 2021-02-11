//
//  ViewController.swift
//  test0126
//
//  Created by 内藤佑馬 on 2021/01/26.
//  Copyright © 2021 内藤佑馬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var textname: UITextField!
    @IBOutlet weak var UIswitch: UISwitch!
    @IBOutlet weak var humanText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var humans: [String] = ["内藤","佐藤","山田","国枝","高井"]
    var btnTimer: Timer!
    
    func startTimer() {
        self.btnTimer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.changeHuman),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func changeHuman() {
        var human: String!
        human = humans.randomElement()
        humanText.text = human
    }
    
    @IBAction func start(_ sender: Any) {
        startTimer()
    }
       
    @IBAction func stop(_ sender: Any) {
        btnTimer!.invalidate()
    }

    @IBAction func btnsend(_ sender: Any) {
        var addName: String!
        addName = textname.text!
        if (!addName.isEmpty) {
            hello.text = "hello " + addName
            humans.append(addName)
        } else {
            hello.text = "悪い事を考えたって無駄だよ"
        }
        
    }
    
    @IBAction func touch(_ sender: Any) {
        if(UIswitch.isOn){
            hello.textColor = UIColor.red
        }else{
            hello.textColor = UIColor.blue
        }
    }
    
    @IBAction func changeDisplay(_ sender: UIButton) {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

