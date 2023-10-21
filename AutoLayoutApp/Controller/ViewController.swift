//
//  ViewController.swift
//  AutoLayoutApp
//
//  Created by Anastasiya Omak on 20/10/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var background: UIButton!
    @IBOutlet weak var image: UIButton!
    @IBOutlet weak var animalsImage: UIImageView!
    
    var backgroundTheme = false
    var mainText = "White"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundIsOn(ison: backgroundTheme)
        background.layer.cornerRadius = 10
        image.layer.cornerRadius = 10
        cleanButton.layer.cornerRadius = 10
        musicButton.layer.cornerRadius = 10
        returnButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        self.image.isHidden = false
        self.background.isHidden = false
        self.musicButton.isHidden = false
        self.animalsImage.isHidden = false
    }
    
    @IBAction func cleanButtonTapped(_ sender: UIButton) {
        self.image.isHidden = true
        self.background.isHidden = true
        self.musicButton.isHidden = true
        self.animalsImage.isHidden = true
    }
    
    @IBAction func playMusic(_ sender: UIButton) {
        playSound(soundName: "sound")
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: "sound", withExtension: "wav", subdirectory: "Sounds")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    
    @IBAction func imageChanged(_ sender: UIButton) {
        let arrayImage = [ #imageLiteral(resourceName: "owl"), #imageLiteral(resourceName: "lemurOne"), #imageLiteral(resourceName: "owl"), #imageLiteral(resourceName: "lemurTwo")]
        animalsImage.image = arrayImage.randomElement()
    }
    
    
    
    @IBAction func backgroundButtonTapped(_ sender: UIButton) {
        backgroundIsOn(ison: backgroundTheme)
    }
    
    func backgroundIsOn(ison: Bool) {
        mainText = ison ? "White" : "Gray"
        background.setTitle(mainText, for: .normal)
        background.setTitleColor(ison ? UIColor.white : UIColor.gray, for: .normal)
        
        view.backgroundColor = ison ? UIColor.gray : UIColor.white
        
        backgroundTheme.toggle()
    }
    
}

