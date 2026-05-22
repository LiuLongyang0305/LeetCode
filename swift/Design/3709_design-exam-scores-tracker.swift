//https://leetcode.cn/problems/design-exam-scores-tracker/
class ExamTracker {

    private typealias Pair = (time: Int, score: Int)
    private var preffix = [Pair]()

    init() {
        preffix.append((-1,0))
    }

    func record(_ time: Int, _ score: Int) {
        preffix.append((time,preffix.last!.score + score))
    }

    func totalScore(_ startTime: Int, _ endTime: Int) -> Int {

        return binarySearchForLastSmallerOrEqualTo(endTime) - binarySearchForFirstLargeOrEqualTo(startTime)
    }

    private func binarySearchForFirstLargeOrEqualTo(_ time: Int) -> Int {

        let N = preffix.count
        if time == preffix.last!.time {return preffix[N - 2].score}
        var l = 0
        var r = N - 1
        while l < r {
            let m = (l + r) >> 1
            if preffix[m].time >= time {
                r = m
            } else {
                l = m + 1
            }
        }
        return preffix[l - 1].score
    }

    private func binarySearchForLastSmallerOrEqualTo(_ time: Int) -> Int {

        let N = preffix.count
        if time == preffix.last!.time {return preffix[N - 1].score}

        var l = 0
        var r = N - 1

        while l < r {
            let m = (l + r + 1) >> 1
            if preffix[m].time <= time {
                l = m
            } else {
                r = m - 1
            }
        }
        return preffix[l].score
    }
}
