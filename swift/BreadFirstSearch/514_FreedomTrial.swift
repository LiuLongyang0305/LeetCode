 //https://leetcode.com/problems/freedom-trail/
 class Solution {
    struct State {
        var steps: Int//目前为止旋转次数
        var currentPosition: Int//当前位置
    }
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        //建立字符和对应下标的映射，方便后面计算旋转次数
        var charToIndices = [Character:Set<Int>]()
        let chars = Array<Character>(ring)
        let cycleSteps = ring.count
        for index in 0..<chars.count {
            if nil == charToIndices[chars[index]] {
                charToIndices[chars[index]] = []
            }
            charToIndices[chars[index]]?.insert(index)
        }
        //初始状态
        var statues = [State]([State(steps: 0, currentPosition: 0)])
        for ch in key {
            var nextLevel = [State]()
            if let indices = charToIndices[ch] {
                for index in indices {
                    //上一层的位置 ---> 当前字符的位置，只需要取总旋转次数最小的哪一个保存
                    var steps = Int.max
                    for state in statues {
                        let temp = abs(state.currentPosition - index)
                        steps = min(steps, min(temp, cycleSteps - temp) + state.steps)//取顺时针和逆时针旋转中的最小值
                    }
                    nextLevel.append(Solution.State(steps: steps, currentPosition: index))
                }
            }
            statues = nextLevel
        }
        var ans = Int.max
        for state in statues {
            ans = min(ans, state.steps)
        }
        return ans + key.count //旋转次数  + 按钮次数
    }
 }
