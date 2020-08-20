 //
//  ViewController.swift
//  MusicPlayer
//
//  Created by 박세란 on 2020/08/18.
//  Copyright © 2020 박세란. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //인터페이스 빌더에 올려뒀던, UI 인터페이스 요소랑 연결할 프로퍼티
    //인스턴스 프로퍼티 이므로, 인스턴스 프로퍼티 네이밍 룰을 따른다.
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton){
        print("button tapped")
    }

}



