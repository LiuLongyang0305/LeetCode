//https://leetcode.com/problems/online-election/
 class TopVotedCandidate {
    typealias ElectionResult  = (time:Int,result: [Int:Int],winner:Int)
    private var electionsResults = [ElectionResult]()
    init(_ persons: [Int], _ times: [Int]) {
        for i in 0..<persons.count {
            if var tempResult = electionsResults.last {
                tempResult.time  = times[i]
                if let c = tempResult.result[persons[i]] {
                    tempResult.result.updateValue(c + 1, forKey: persons[i])
                } else {
                    tempResult.result.updateValue(1, forKey: persons[i])
                }
                
                if let lastWinnerCount = tempResult.result[tempResult.winner], let new = tempResult.result[persons[i]], new >= lastWinnerCount {
                    tempResult.winner = persons[i]
                    electionsResults.append(tempResult)
                } else {
                    electionsResults.append(tempResult)
                }
            } else {
                electionsResults.append((times[i],[persons[i]:1],persons[i]))
            }
        }
    }
    
    func q(_ t: Int) -> Int {
        var left = 0
        var right = electionsResults.count
        while left < right {
            let mid = left + (right - left) >> 1
            if electionsResults[mid].time > t {
                right =  mid
            } else {
                left = mid + 1
            }
        }
        return electionsResults[left - 1].winner
    }
 }

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * let obj = TopVotedCandidate(persons, times)
 * let ret_1: Int = obj.q(t)
 */