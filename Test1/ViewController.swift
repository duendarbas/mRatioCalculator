//
//  ViewController.swift
//  Test1
//
//  Created by Duendar Bas on 23.12.18.
//  Copyright © 2018-2019 Duendar Bas. All rights reserved.
//



// TO DO :   NAN MUSS VERSCHWINDEN

import UIKit

class ViewController: UIViewController, UITextFieldDelegate

{

    // Variable Labels starten hier
    
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var zoneLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    // Variable Eingabefelder starten hier
    
    @IBOutlet weak var players: UITextField!
    @IBOutlet weak var ante: UITextField!
    @IBOutlet weak var sb: UITextField!
    @IBOutlet weak var bb: UITextField!
    @IBOutlet weak var stack: UITextField!
    
    // GO Funktion startet hier
    
    @IBAction func go(_ sender: UIButton, forEvent event: UIEvent)
        
    {
        
    // Festlegung der Variablen auf Typ Double
        let valuePlayers = Double(players.text!)
        let valueAnte = Double(ante.text!)
        let valueSB = Double(sb.text!)
        let valueBB = Double(bb.text!)
        let valueStack = Double(stack.text!)
        let fullRing: Double = 10
        
    // Bedingung, dass alle Felder ausgefüllt sein müssen
        
        if valuePlayers != nil && valueAnte != nil && valueSB != nil && valueBB != nil && valueStack != nil {
        
    // Berechnungen der Teilkosten (Antes & Blinds)
            
        let costsAntes = Double(valuePlayers! * valueAnte!)
        let costsBlinds = Double(valueSB! + valueBB!)
        
    // Berechnung des effektiven M
        
        let effectiveM = Double(valuePlayers! / fullRing)
    
    // Berechnung der Gesamtkosten
            
        let costsTotal = Double(costsAntes + costsBlinds)
            
    // Berechnung des M-Ratio
 
        let mRatio = Double((valueStack! / costsTotal) * effectiveM)
        
    // Festlegung der Zonen einschließlich Darstellung und Erklärungen
            
            if mRatio >= 20
            {
                zoneLabel.text = "Green Zone"
                explanationLabel.text = "Great situation! You're free to play conservatively or aggressively - as you like."
            }
            
            if mRatio < 20 && mRatio >= 10
            {
                zoneLabel.text = "Yellow zone"
                explanationLabel.text = "Take more risks now. Small pairs and small suited connectors lose value."
            }
            
            if mRatio < 10 && mRatio >= 6
            {
                zoneLabel.text = "Orange Zone"
                explanationLabel.text = "If you play, be the first one to bet. It's important to preserve your chips now."
            }
            
            if mRatio < 6 && mRatio >= 1
            {
                zoneLabel.text = "Red Zone"
                explanationLabel.text = "All-in or fold!"
            }
            
            if mRatio < 1
            {
                zoneLabel.text = "☠️ Dead Zone ☠️"
                explanationLabel.text = "Just shove all-in into an unraised pot and pray. 🙏"
            }
 
    // Fehlermeldung, falls Player = 0
            
            if mRatio == 0.0
            {
                zoneLabel.text = "💩"
                explanationLabel.text = "Please enter valid numbers. Thank you for your cooperation."
            }
            
    // Ausgabe M =
            
            mLabel.text = "M = \(mRatio)";
        }
        
    // Fehlermeldung falls nicht alle Felder ausgefüllt sind
            
        else
        
        {
            zoneLabel.text = "💩"
            explanationLabel.text = "Please fill out all numbers"
        }
    }
    
    //_____________________________________________________________________________________________________
    
    override func viewDidLoad() {
        super.viewDidLoad()
        players.delegate = self
        ante.delegate = self
        sb.delegate = self
        bb.delegate = self
        stack.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
      }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        

    }

    
}

























