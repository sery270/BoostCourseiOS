//
//  ViewController2.swift
//  MusicPlayer
//
//  Created by 박세란 on 2020/10/05.
//  Copyright © 2020 박세란. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    // MARK: IBOutlets
    //인터페이스 빌더에 올려뒀던, UI 인터페이스 요소랑 연결할 프로퍼티
    //인스턴스 프로퍼티 이므로, 인스턴스 프로퍼티 네이밍 룰을 따른다.
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func touchUpPlayPauseButton(
        _sender: UIButton) {
        print("btn tapped")
    }

    @IBAction func sliderValueChangedOne(_sender: UISlider) {
        print("slider value changed")
    }
}
