// https://leetcode.com/problems/output-contest-matches/
    func findContestMatch(_ n: Int) -> String {
        var queue = (1...n).map {"\($0)"}
        while queue.count > 1 {
            var nextLevel = [String]()
            let N = queue.count
            for i in 0..<(N >> 1){
                nextLevel.append("(\(queue[i]),\(queue[N - i - 1]))")
            }
            queue = nextLevel
        }
        return queue[0]
    }
}