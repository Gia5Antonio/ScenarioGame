//
//  FourthMovesViewController.swift
//  ScenarioGame
//
//  Created by Antonio Giaquinto on 19/02/18.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit

class FourthMovesViewController: UIViewController {
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
    //right answer
    @IBAction func wrongAnswer(){
        debugPrint("Wrong, Result = \(Datas.shared.result)")
    }
    //when i pick the final correct answer
    @IBAction func correctThirdFinalAnswer(){
        if Datas.shared.thirdInSequence == true {
            rightAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "end") as? FourthMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
            }
        }else {
            wrongAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "end") as? FourthMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
            }
        }
    }
    //if i pick the first one in sequence
    @IBAction func firstCorrectPhaseAnswer(){
        Datas.shared.firstInSequence = true
        debugPrint("first in sequence correct")
    }
    //in i pick the second one in sequence
    @IBAction func secondCorrectPhaseAnswer(){
        if Datas.shared.firstInSequence == true {
            debugPrint("second in sequence correct")
            Datas.shared.secondInSequence = true
        }else {
            wrongAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "end") as? FourthMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.firstInSequence = false
                Datas.shared.secondInSequence = false
                Datas.shared.thirdInSequence = false
            }
        }
    }
    //if i pick the third one in sequence
    @IBAction func thirdCorrectPhaseAnswer(){
        if Datas.shared.secondInSequence == true {
            Datas.shared.thirdInSequence = true
            debugPrint("third in sequence correct")
        }else {
            wrongAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "end") as? FourthMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.firstInSequence = false
                Datas.shared.secondInSequence = false
                Datas.shared.thirdInSequence = false
            }
        }
    }
}
