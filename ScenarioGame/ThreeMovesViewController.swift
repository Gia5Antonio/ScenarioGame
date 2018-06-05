//
//  ThreeMovesViewController.swift
//  ScenarioGame
//
//  Created by Antonio Giaquinto on 19/02/18.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit

class ThreeMovesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //right answer
    @IBAction func rightAnswer(){
        Datas.shared.result = Datas.shared.result+1
        debugPrint("Correct, Result = \(Datas.shared.result)")
    }
    //wrong answer
    @IBAction func wrongAnswer(){
        debugPrint("Wrong, Result = \(Datas.shared.result)")
        Datas.shared.firstInSequence = false
        Datas.shared.secondInSequence = false
    }
    //if i pick the first one of the sequence
    @IBAction func firstCorrectPhaseAnswer(){
        Datas.shared.firstInSequence = true
        debugPrint("first in sequence correct")
    }
    //if i pick the second one of the sequence
    @IBAction func secondCorrectPhaseAnswer(){
        if Datas.shared.firstInSequence == true {
            Datas.shared.secondInSequence = true
            debugPrint("second in sequence correct")
        }else {
            wrongAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "eighth") as? FourthMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
            }
        }
    }
    //when i pick the final correct one
    @IBAction func correctSecondFinalAnswer(){
        if Datas.shared.secondInSequence == true {
            rightAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "eighth") as? FourthMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
            }
        }else{
            wrongAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "eighth") as? FourthMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
            }
        }
    }
}
