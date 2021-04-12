//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyC(_ sender: UIButton) {
        
        playSound(name: "C")
    }
    
    @IBAction func keyD(_ sender: UIButton) {
        
        playSound(name: "D")
    }
    
    @IBAction func keyE(_ sender: UIButton) {
        
        playSound(name: "E")
    }
    
    @IBAction func keyF(_ sender: UIButton) {
        
        playSound(name: "F")
    }
    
    
    @IBAction func keyG(_ sender: UIButton) {
    
        playSound(name: "G")
    }
    
    
    @IBAction func keyA(_ sender: UIButton) {
    
        playSound(name: "A")
    }
    
    @IBAction func keyB(_ sender: UIButton) {
    
        playSound(name: "B")
    }
    
    func playSound(name: String) {
        
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

