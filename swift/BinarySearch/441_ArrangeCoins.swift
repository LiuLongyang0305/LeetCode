class Q441_Solution {
    func arrangeCoins(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var low = 1
        var high = n - 1
        while low < high {
            let mid = low + (high - low) / 2
            let rel = mid * (mid + 1) / 2
            let rel2 = (mid + 1) * (mid + 2) / 2
            if rel <= n && rel2 > n {
                return mid
            } else if rel > n {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low
    }
}