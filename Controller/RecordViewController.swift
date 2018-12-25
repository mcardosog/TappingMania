//
//  RecordViewController.swift
//  TapMania
//
//  Created by Marco Cardoso on 11/3/18.
//  Copyright © 2018 MCG_CODE. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    //********* VISUALS *********
    @IBOutlet weak var button_Background: UIButton!
    @IBOutlet weak var button_Back: UIButton!
    @IBOutlet weak var label_Easy: UILabel!
    @IBOutlet weak var label_EasyScore: UILabel!
    @IBOutlet weak var label_Medium: UILabel!
    @IBOutlet weak var label_MediumScore: UILabel!
    @IBOutlet weak var label_Hard: UILabel!
    @IBOutlet weak var label_HardScore: UILabel!
    @IBOutlet weak var label_Unfair: UILabel!
    @IBOutlet weak var label_UnfairScore: UILabel!
    //********* END VISUALS *********
    
    private let defaults: UserDefaults = UserDefaults.init()    //Stores the app defaults values. Used to store settigns and records
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
        
        Modelator.formatButton(buttons: [button_Background])
        Modelator.formatButtonBack(button: button_Back)
        
        adjustVisual()
        
    }
    
    @IBAction func returnMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "segue_RecordsToMainMenu", sender: nil)
    }
    
    //Load the default score values
    private func loadDefaults(){
        loadDefaults(key: "Score_Easy")
        loadDefaults(key: "Score_Medium")
        loadDefaults(key: "Score_Hard")
        loadDefaults(key: "Score_Unfair")
    }
    
    //Load the default values and update the label text
    private func loadDefaults(key : String){
        let score = defaults.value(forKey: key) as! Int
        
        switch key {
        case "Score_Easy":
            updateLabelScore(label: label_EasyScore, score: score)
        case "Score_Medium":
            updateLabelScore(label: label_MediumScore, score: score)
        case "Score_Hard":
            updateLabelScore(label: label_HardScore, score: score)
        case "Score_Unfair":
            updateLabelScore(label: label_UnfairScore, score: score)
        default:
            print("Error: Default executed @loadDefaults RecordViewContoller")
        }
    }
    
    //Update Current score label
    private func updateLabelScore(label : UILabel, score : Int){
        label.text = String(score)
    }
    
    //Make adjustments to fit the content in display of iPhone 5 and SE
    private func adjustVisual(){
        if(UIDevice.current.name.contains("SE") || UIDevice.current.name.contains("5")){
            label_Medium.topAnchor.constraint(equalTo: label_Easy.bottomAnchor, constant: 10).isActive = true
            label_MediumScore.topAnchor.constraint(equalTo: label_EasyScore.bottomAnchor, constant: 10).isActive = true
            label_Hard.topAnchor.constraint(equalTo: label_Medium.bottomAnchor, constant: 10).isActive = true
            label_HardScore.topAnchor.constraint(equalTo: label_MediumScore.bottomAnchor, constant: 10).isActive = true
            label_Unfair.topAnchor.constraint(equalTo: label_Hard.bottomAnchor, constant: 10).isActive = true
            label_UnfairScore.topAnchor.constraint(equalTo: label_HardScore.bottomAnchor, constant: 10).isActive = true
        }
    }
    
}
