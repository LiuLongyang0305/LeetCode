class Q657_Solution {
    func judgeCircle(_ moves: String) -> Bool {
        typealias StepCount = (Up:Int,Right:Int)
        var stepCounter : StepCount = (0,0)
        for step in moves {
            switch step {
            case "U":
                stepCounter.Up += 1
            case "R":
                stepCounter.Right += 1
            case "L":
                stepCounter.Right -= 1
            case "D":
                stepCounter.Up -= 1
            default:
                break
            }
        }
        return stepCounter.Right == 0 && stepCounter.Up == 0
    }
}