// https://leetcode.com/problems/find-longest-awesome-substring/
class Solution {
    func longestAwesome(_ s: String) -> Int {
        var ans = 1
        var state = [[Bool]:Int]()
        let sToIntNumbers = s.map { Int($0.asciiValue! - 48)}
        var curState = Array<Bool>(repeating: false, count: 10)
        let N = s.count
        state[curState] = -1
        func getMaxLength(_ curState: [Bool], _ curIndex: Int) -> Int {
            var ans = 1
            if let index = state[curState] {
                ans = max(ans, curIndex - index)
            }
            var stateCopy = curState
            for i in 0..<10 {
                let t = stateCopy[i]
                stateCopy[i] = !t
                if let index = state[stateCopy] {
                    ans = max(curIndex - index, ans)
                }
                stateCopy[i] = t
            }
            return ans
        }
        for i in 0..<N {
            curState[sToIntNumbers[i] ] = !curState[sToIntNumbers[i]]
            ans = max(getMaxLength(curState,i),ans)
            if nil == state[curState] {
                state[curState] = i
            }
        }
        return ans
    }
}