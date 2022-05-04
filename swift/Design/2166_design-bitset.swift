//https://leetcode.com/problems/design-bitset/
class Bitset {


    private let size: Int
    private var onesCnt = 0
    private var flipFlag = false
    private var data: [Bool]
    init(_ size: Int) {
        self.size = size
        self.data = [Bool](repeating: false, count: size)
    }

    func fix(_ idx: Int) {
        precondition(idx >= 0 && idx < size)
        if flipFlag == data[idx] {
            data[idx] = !data[idx]
            onesCnt += 1
        }
    }

    func unfix(_ idx: Int) {
        precondition(idx >= 0 && idx < size)
        if flipFlag != data[idx] {
            onesCnt -= 1
            data[idx] = !data[idx]
        }
    }

    func flip() {
        flipFlag = !flipFlag
        onesCnt = size - onesCnt
    }

    func all() -> Bool {
        return onesCnt == size
    }

    func one() -> Bool {
        return onesCnt > 0
    }

    func count() -> Int {
        return onesCnt
    }

    func toString() -> String {
        var ans = ""
        var i = 0
        while i < size {
            if !flipFlag {
                ans.append(data[i] ? "1" : "0")
            } else {
                ans.append(data[i] ? "0" : "1")
            }
            i += 1
        }
        return ans
    }
}