class Q70_Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        } else {
            var oneStepBefore = 2
            var twoStepBefore = 1
            for _ in 3...n {
                let temp = oneStepBefore + twoStepBefore
                twoStepBefore = oneStepBefore
                oneStepBefore = temp
            }
            return oneStepBefore
        }
    }
}