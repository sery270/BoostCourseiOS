//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 박세란 on 2020/08/18.
//  Copyright © 2020 박세란. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK:- PROPERTIES
    var player: AVAudioPlayer!
    var timer: Timer!

    // MARK: IBOutlets
    //인터페이스 빌더에 올려뒀던, UI 인터페이스 요소랑 연결할 프로퍼티
    //인스턴스 프로퍼티 이므로, 인스턴스 프로퍼티 네이밍 룰을 따른다.
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    // MARK:- METHODS
    // MARK: Custom method
    //플레이어를 초기화하는 메서드
    func initializePlayer(){
        
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else{
            print("음원 파일 에셋을 가져올 수 없습니다.")
            return
        }
        
        do{
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    //레이블을 매초마다 업데이트하는 메서드
    func updateTimeLableText(time: TimeInterval){
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute,second,milisecond)
        
        self.timeLabel.text = timeText
    }
    
    //타이머를 만들고 수행할 메서드
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {[unowned self]
            (timer: Timer) in
            
            if self.progressSlider.isTracking {return}
            
            self.updateTimeLableText(time:self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    
    //타이머를 해제할 메서드
    func invalidateTiemr(){
        self.timer.invalidate()
        self.timer = nil
    }
    
    // MARK: AVAudioPlayerDelegate
    //오디오 플레이어 디코드
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction: UIAlertAction = UIAlertAction(title: "", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //오디오 플레이어가 재생을 끝냈을때 실행할 메서드
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLableText(time: 0)
        self.invalidateTiemr()
    }
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializePlayer()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: IBActions
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton){
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player!.play()
        } else {
            self.player!.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTiemr()
           // self.initializePlayer() => 버튼 누르면 처음으로 돌아감
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        self.updateTimeLableText(time: TimeInterval(sender.value))
        if sender.isTracking {return}
        self.player.currentTime = TimeInterval(sender.value)
    }
}
