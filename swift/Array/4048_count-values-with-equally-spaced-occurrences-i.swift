class Solution {
    typealias Info = (cnt:Int,space:Int?,firstThreeIndices:[Int], last:Int,Flag:Bool)
    func countSpecialIntegers(_ nums: [Int]) -> Int {
        var valueToInfo = [Int:Info]()
        for (i,v) in nums.enumerated() {
            if var info = valueToInfo[v] {
                guard info.Flag else {continue}
                info.cnt += 1
                if info.firstThreeIndices.count < 3 {
                    info.firstThreeIndices.append(i)
                    if info.firstThreeIndices.count == 3 {
                        guard 2 * info.firstThreeIndices[1] == info.firstThreeIndices[0] + info.firstThreeIndices[2] else {
                            info.Flag = false
                            valueToInfo[v] = info
                            continue
                        }
                        info.space = info.firstThreeIndices[1] - info.firstThreeIndices[0]
                    }
                }
                if let s = info.space {
                    guard i - info.last == s else {
                        info.Flag = false
                        valueToInfo[v] = info
                        continue
                    }
                }

                info.last = i
                valueToInfo[v] = info

            } else {
               valueToInfo[v] = (1,nil,[i],i,true)
            }
        }
        var sb = 0
        for (_,info) in valueToInfo {
            if info.Flag && info.cnt == 3 {
                sb += 1
            }
        }
        return sb
    }
}
