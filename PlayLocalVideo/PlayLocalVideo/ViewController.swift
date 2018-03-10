//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by serfusE on 25/09/2017.
//  Copyright © 2017 null. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Outlet
    
    @IBOutlet weak var videoTableView: UITableView!
    
    
    // MARK: Properties
    
    var videos: [Video] = [
        Video(image: "Screenshot1", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "Screenshot2", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "Screenshot3", title: "Seals Documentary", source: "Vine - 00:06"),
    ]
    
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    
    // MARK: Tableview Methods
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        let video = videos[indexPath.row]
        cell.screenshotImage.image = UIImage(named: video.image)
        cell.titleLabel.text = video.title
        
        return cell
    }
    
    
    // MARK: Action
    
    @IBAction func playButtonDidTouch(_ sender: Any) {
        guard let path = Bundle.main.path(forResource: "emoji video", ofType: "mp4") else {
            print("invaild path.")
            return
        }
        playerView = AVPlayer(url: URL(fileURLWithPath: path))
        
        playerViewController.player = playerView
        
        self.present(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
        
    }
    


}

