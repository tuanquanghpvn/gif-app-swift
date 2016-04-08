//
//  DetailViewController.swift
//  FullGif
//
//  Created by  on 3/9/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var dataSelected: AnyObject!
    
//    var playerItem:AVPlayerItem?
//    var player:AVPlayer?
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        player?.actionAtItemEnd = .None
        
        let sizeRect = UIScreen.mainScreen().bounds
        let width    = sizeRect.size.width
        let height   = sizeRect.size.height
        
        let urlData = dataSelected["mp4"] as! String
        let url = NSURL(string: urlData)
        
        playerView = AVPlayer(URL: url!)
        
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
        
//        playerItem = AVPlayerItem(URL: url!)
//        player = AVPlayer(playerItem: playerItem!)
//        let playerLayer = AVPlayerLayer(player: player!)
//        playerLayer.frame = CGRectMake(0, height / 4, width, 350)
//        player?.play()
//        self.view.layer.addSublayer(playerLayer)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
