//
//  ViewController.swift
//  StopWatch
//
//  Created by serfusE on 21/09/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    @IBOutlet weak var TimeLabel: UILabel!
    
    // MARK: Properties
    
    var count = 0.0
    var timer = Foundation.Timer()
    var isPlaying = false
    
    
    // MARK: Actions
    
    @IBAction func playButtonDidTouch(_ sender: Any) {
        if isPlaying { return }
        PlayButton.isEnabled = false
        PauseButton.isEnabled = true
        timer = .scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: Any) {
        if !isPlaying { return }
        PauseButton.isEnabled = false
        PlayButton.isEnabled = true
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        timer.invalidate()
        count = 0
        TimeLabel.text = String(count)
        isPlaying = false
        PlayButton.isEnabled = true
        PauseButton.isEnabled = false
    }
    
    
    // MARK: Methods
    
    func updateTimer() {
        count += 0.1
        TimeLabel.text = String(format: "%.1f", count)
    }
    


}

