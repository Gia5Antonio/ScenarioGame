//
//  TwoMovesViewController.swift
//  ScenarioGame
//
//  Created by Antonio Mone on 19/02/18.
//  Copyright © 2018 Antonio Mone. All rights reserved.
//

import UIKit

class TwoMovesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //right final choice
    @IBAction func rightAnswer() {
        debugPrint("First in sequence = false")
        Datas.shared.firstInSequence = false
        Datas.shared.result = Datas.shared.result+1
        debugPrint("Correct, Result = \(Datas.shared.result)")
    }
    
    //wrong choice
    @IBAction func wrongAnswer() {
        debugPrint("Wrong, Result = \(Datas.shared.result)")
        debugPrint("First in sequence = false")
        Datas.shared.firstInSequence = false
    }
    
    //when pressing on the correct final answer
    @IBAction func correctFirstFinalAnswer() {
        //correct field
        //if i am in the sixth view and i picked the right sequence button
        if Datas.shared.firstInSequence && Datas.shared.sixth {
            rightAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "seventh") as? ThreeMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.fourth = false
                Datas.shared.fifth = false
                Datas.shared.sixth = false
            }
        }
        //if i am in the fifth view and i picked the right sequence button
        else if Datas.shared.firstInSequence && Datas.shared.fifth {
            rightAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "sixth") as? TwoMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.sixth = true
                Datas.shared.fifth = false
            }
        }
        //if i am in the fourth view and i picked the right sequence button
        else if Datas.shared.firstInSequence && Datas.shared.fourth {
            rightAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "fifth") as? TwoMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.fifth = true
                Datas.shared.fourth = false
            }
        }
        //if i am in the third view and i picked the right sequence button
        else if Datas.shared.firstInSequence && !Datas.shared.fourth{
            rightAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "fourth") as? TwoMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.fourth = true
            }
        }
        //wrongs field
        //if i am in the sixth view but i didn't picked the right sequence button
        if !Datas.shared.firstInSequence && Datas.shared.sixth{
                wrongAnswer()
                if let destination = storyboard?.instantiateViewController(withIdentifier: "seventh") as? ThreeMovesViewController{
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.window?.rootViewController = destination
                    Datas.shared.fourth = false
                    Datas.shared.fifth = false
                    Datas.shared.sixth = false
                }
        }
        //if i am in the fifth view but i didn't picked the right sequence button
        else if !Datas.shared.firstInSequence && Datas.shared.fifth{
                wrongAnswer()
                if let destination = storyboard?.instantiateViewController(withIdentifier: "sixth") as? TwoMovesViewController{
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.window?.rootViewController = destination
                    Datas.shared.sixth = true
                    Datas.shared.fifth = false
                }
        }
        //if i am in the fourth view but i didn't picked the right sequence button
        else if !Datas.shared.firstInSequence && Datas.shared.fourth {
            wrongAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "fifth") as? TwoMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.fifth = true
                Datas.shared.fourth = false
            }
        }
        //if i am in the third view but i didn't picked the right sequence button
        else if !Datas.shared.firstInSequence && !Datas.shared.fourth{
            wrongAnswer()
            if let destination = storyboard?.instantiateViewController(withIdentifier: "fourth") as? TwoMovesViewController{
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = destination
                Datas.shared.fourth = true
            }
        }
    }
    //correct first in the sequence in order to win, firstInSequence -> true
    @IBAction func firstCorrectPhaseAnswer(){
        Datas.shared.firstInSequence = true
        debugPrint("first in sequence correct")
    }
}
