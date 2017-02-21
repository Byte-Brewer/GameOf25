//
//  GameViewController.swift
//  GameOf25
//
//  Created by Nazar on 19.02.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var conto = 1
    var timer: Timer?
    var timerCount = 0.0
    var userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        nextNumber.text = "1"
        bestTimeLabel.text = userDefault.object(forKey: "time") as! String? ?? "you Winner"
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(GameViewController.printTime),
                                     userInfo: nil,
                                     repeats: true)
        
        passNumberInButton(arrayOfButton: buttonCollection)
    }
    
    func printTime(){
        timerLabel.text = String(format: "%1f", timerCount)
            //String(describing: timerCount)
        
        timerCount += 0.01
    }
    
    @IBOutlet weak var bestTimeLabel: UILabel!
    @IBOutlet weak var nextNumber: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonTouch(_ sender: UIButton) {
        let button = Int((sender.titleLabel?.text)!)
        if button == conto {
            conto += 1
            nextNumber.text = String(conto)
            sender.setTitle("  ", for: .normal)
        } else {
            conto = 1
            timer?.invalidate()
            timerLabel.text = "0.0"
            nextNumber.text = String(conto)
        }
        if conto == 26 {
            nextNumber.text = "Win"
            timer?.invalidate()
            userDefault.set(String(format: "%3f", timerCount), forKey: "time")
            bestTimeLabel.text = (userDefault.object(forKey: "time") as! String)
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        timer?.invalidate()
        timerCount = 0.0
        passNumberInButton(arrayOfButton: buttonCollection)
        conto = 1
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(GameViewController.printTime),
                                     userInfo: nil,
                                     repeats: true)
        nextNumber.text = "1"
    }
    func passNumberInButton(arrayOfButton: [UIButton]) {
        let array = randomArray()
        for i in 0...24 {
            arrayOfButton[i].setTitle(String(array[i]), for: .normal)
        }
    }
    
    func randomArray() -> [Int] {
        var startArray: [Int] = []
        var finishArray = startArray
        for i in 1...25 {
            startArray.append(i)
        }
        for i in 1...25 {
            let temp = Int(arc4random_uniform(UInt32(26 - i)))
            finishArray.append(startArray.remove(at: temp))
        }
        return finishArray
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
