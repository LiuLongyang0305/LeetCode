// https://leetcode.com/problems/partition-to-k-equal-sum-subsets/
 //Broute Force
 class Solution1 {
    typealias State = [Int:Int]
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        guard k != 1  else {
            return true
        }
        guard k != nums.count else {
            return Set<Int>(nums).count == 1
        }
        let sum = nums.reduce(0) {$0 + $1}
        guard sum % k == 0 else {
            return false
        }
        let targetSum = sum / k
        let sortedNums = nums.sorted().reversed()
        guard sortedNums.last! <= targetSum else {
            return false
        }
        let startState: State = [0:k]
        var states = [State]()
        states.append(startState)
        for num in sortedNums {
            var nextLevel = [State]()
            for state in states {
                for (sum,count) in state {
                    let nextSum = sum + num
                    if nextSum <= targetSum {
                        var temp = state
                        if count == 1 {
                            temp.removeValue(forKey: sum)
                        } else {
                            temp.updateValue(count - 1, forKey: sum)
                        }
                        temp.updateValue((temp[nextSum] ?? 0)  + 1, forKey: nextSum)
                        nextLevel.append(temp)
                    }
                }
            }
            states = nextLevel
        }
        for state in states {
            if state.count == 1 {
                for (sum,count) in state {
                    if sum ==  targetSum &&  count == k {
                        return true
                    }
                }
            }
        }
        return false
    }
 }
 //DFS
 class Solution2 {
    typealias State = [Int:Int]
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        guard k != 1  else {
            return true
        }
        guard k != nums.count else {
            return Set<Int>(nums).count == 1
        }
        let sum = nums.reduce(0) {$0 + $1}
        guard sum % k == 0 else {
            return false
        }
        let targetSum = sum / k
        let sortedNums = nums.sorted { $0 > $1}
        guard sortedNums.last! <= targetSum else {
            return false
        }
        let startState: State = [0:k]
        let N = sortedNums.count
        var ans = false
        func dfs(state: State, nextIndex currentIndex: Int) {
            guard !ans else {
                return
            }
            guard currentIndex < N  else {
                if state.count == 1, let c = state[targetSum],  c ==  k {
                    ans = true
                }
                return
            }
            for (sum,count) in state {
                let nextSum = sum + sortedNums[currentIndex ]
                if nextSum <= targetSum {
                    var temp = state
                    if count == 1 {
                        temp.removeValue(forKey: sum)
                    } else {
                        temp.updateValue(count - 1, forKey: sum)
                    }
                    temp.updateValue((temp[nextSum] ?? 0)  + 1, forKey: nextSum)
                    dfs(state: temp, nextIndex: currentIndex + 1)
                }
            }
        }
        dfs(state: startState, nextIndex: 0)
        return ans
    }
 }
 
 //构造字迹进行搜索
 class Solution3 {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        guard k != 1  else {
            return true
        }
        guard k != nums.count else {
            return Set<Int>(nums).count == 1
        }
        let sum = nums.reduce(0) {$0 + $1}
        guard sum % k == 0 else {
            return false
        }
        let targetSum = sum / k
        let sortedNums = nums.sorted { $0 > $1}
        guard sortedNums.last! <= targetSum else {
            return false
        }
        let N = nums.count
        func search(_ groups: inout [Int], _ row: Int) -> Bool {
            guard row < N else {
                return true
            }
            let num = sortedNums[row]
            for i in 0..<groups.count {
                if groups[i] + num <= targetSum {
                    groups[i] += num
                    if search(&groups, row + 1) {
                        return true
                    }
                    groups[i] -= num
                }
                if groups[i] == 0{
                    break
                }
            }
            return false
        }
        var row = 0
        var groupsCount = k
        while row < N && sortedNums[row] == targetSum {
            row += 1
            groupsCount -= 1
        }
        var groups = Array<Int>(repeating: 0, count: groupsCount)
        return search(&groups, row)
    }
 }
 
 
