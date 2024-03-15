import Foundation

class BaseballGame {
    var game_log: Array<Int> = []
    var userInput: Array<String> = []
    var trialCount = 0
    
    func game() {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
        let gameSignal = Int(readLine()!)
        switch gameSignal {
        case 1:
            start()
        case 2:
            print("게임 시도 횟수")
        case 3:
            print("게임 종료 !")
            break
        default:
            break
        }
    }
    
    func start() {
        print("1~9까지의 정수로 세자리 숫자를 입력하세요.")
        let input = readLine()
        
        let inputToInt = String(input!)
        for i in inputToInt {
            userInput.append(String(i))
        }
    }
    //게임의 정답 만들기
    func makeAnswer() -> Set<String> {
        
        var randomSet = Set<String>()
        while randomSet.count < 3 {
            if(randomSet.count != 0) {
                randomSet.insert(String(Int.random(in: 0...9)))
            }
            else {
                randomSet.insert(String(Int.random(in: 1...9)))
            }
        }
        return randomSet
    }
    
    //정답 비교하기
    func compare() {
        var answer = Array(makeAnswer())
        
        var strike: Int = 0
        var priorBall : Int = 0
        
        for i in 0...2 {
            if answer[i] == userInput[i] {
                strike += 1
            }
        }
        
        for i in userInput {
            for r in answer {
                if i == r {
                    priorBall += 1
                }
            }
        }
        
        var ball = priorBall - strike
        print(userInput, answer)
        print("스트라이크 : \(strike), 볼: \(ball)")
    }
}
