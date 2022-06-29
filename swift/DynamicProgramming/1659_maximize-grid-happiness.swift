// https://leetcode.com/problems/maximize-grid-happiness/
class Solution {

    private typealias Info = (introvers:Int,extrovers: Int)
    private struct MemoKey: Hashable {
        var usedIntroverts:Int
        var usedExtrovert:Int
        var mask: Int
    }

    private var states = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 243 )
    private var deltaHapiness = [[Int]](repeating: [Int](repeating: 0, count: 243), count: 243)
    private var peopleCounter = [Info](repeating: (0,0), count: 243)
    private let maxStates = [1,3,9,27,81,243]
    init() {
        for i in 0..<243 {
            var t = i
            for idx in 0..<5 {
                states[i][idx] = t % 3
                t /= 3
            }
        }
        for s1 in 0..<243 {
            for s2 in 0..<243 {
                deltaHapiness[s1][s2] = getDeltaHapiness(s1, s2)
            }
        }

        for state in 0..<243 {
            peopleCounter[state] = getInfo(of: state)
        }
    }

    private func getInfo(of state: Int) -> Info{
        var info: Info = (0,0)
        for i in 0..<5 {
            if states[state][i] == 1 {
                info.introvers += 1
            }
            if states[state][i] == 2 {
                info.extrovers += 1
            }
        }
        return info

    }


    private func getDeltaHapiness(_ last: Int, _ cur: Int) -> Int {
        var ans = 0
            //对上一行的影响
        for i in 0..<5 {
            guard states[cur][i] > 0 && states[last][i] > 0 else {continue}
            ans += states[last][i] == 1 ? -30 : 20
        }

            //当前行新增
        for i in 0..<5 {
            guard states[cur][i] > 0 else {continue}
            let isIntro = states[cur][i] == 1
            ans += isIntro ? 120 : 40
            if states[last][i] > 0 {
                ans += isIntro ? -30 : 20
            }
            if i >= 1 && states[cur][i - 1] > 0   {
                ans += isIntro ? -30 : 20

            }
            if i < 4 && states[cur][i + 1] > 0 {
                ans += isIntro ? -30 : 20
            }
        }
        return ans

    }

    func getMaxGridHappiness(_ m: Int, _ n: Int, _ introvertsCount: Int, _ extrovertsCount: Int) -> Int {

        let curMaxState = maxStates[n]

        var lastRowStates = [MemoKey(usedIntroverts: 0, usedExtrovert: 0, mask: 0) : 0]

        for _ in 0..<m {
            var newStates = [MemoKey:Int]()
            for curState in 0..<curMaxState {
                let (intro,extro) = peopleCounter[curState]
                guard intro <= introvertsCount && extro <= extrovertsCount else {continue}
                for (memoKey,hapiness) in lastRowStates {
                    let curUsedIntro = intro + memoKey.usedIntroverts
                    let curUsedExtro = extro + memoKey.usedExtrovert

                    guard curUsedIntro <= introvertsCount && curUsedExtro <= extrovertsCount else {continue}
                    let curKey = MemoKey(usedIntroverts: curUsedIntro, usedExtrovert: curUsedExtro, mask: curState)
                    newStates[curKey] = max(deltaHapiness[memoKey.mask][curState] + hapiness, newStates[curKey] ?? -1)
                }
            }
            lastRowStates = newStates
        }
        return lastRowStates.values.max()!
    }
}
