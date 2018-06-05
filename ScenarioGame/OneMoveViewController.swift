//
//  OneMoveViewController.swift
//  ScenarioGame
//
//  Created by Antonio Giaquinto on 19/02/18.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit

class OneMoveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //right choice
    @IBAction func rightAnswer(){
        Datas.shared.result = Datas.shared.result+1
        debugPrint("Correct, Result = \(Datas.shared.result)")
        
    }
    //wrong choice
    @IBAction func wrongAnswer(){
        debugPrint("Wrong, Result = \(Datas.shared.result)")
    }


}
