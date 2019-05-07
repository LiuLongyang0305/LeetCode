class Q367_Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 0
        var right = num
        while left < right - 1 {
            let middle = (left + right) / 2
            let rel = middle * middle
            if rel == num {
                return true
            } else if rel > num {
                right = middle
            } else {
                left = middle
            }
        }
        if left * left == num || right * right == num {
            return true
        }
        return false
    }
}