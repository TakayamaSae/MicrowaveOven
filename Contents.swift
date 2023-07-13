import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


class Alarm {
    var timer: Timer?
    var count: Int = 0
    let limit: Int = 5
    
    func start() { //スタート
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定(単位はn秒)
            target: self, // ここは「self」でOK
            selector: #selector(countup), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
    }

    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countup() {
        // countの値をインクリメントする
        count += 1
        print("カウントは\(count)です")
        // countの値がlimitの値以上になったif文を実行
        if limit <= count {
            print("ジリリリリ！(カウントをストップします)")
            // タイマーを止める
            timer?.invalidate()
        }
    }
}

let alarm = Alarm()
//　実際に動かしてる
alarm.start()
