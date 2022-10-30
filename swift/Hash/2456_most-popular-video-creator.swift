// https://leetcode.com/problems/most-popular-video-creator/
class Solution {
    func mostPopularCreator(_ creators: [String], _ ids: [String], _ views: [Int]) -> [[String]] {
        var countView = [String:Int]()
        var countViewIds = [String:[String:Int]]()
        let N = creators.count
        for i in 0..<N {
            let (c,v,id) = (creators[i],views[i],ids[i])
            countView[c,default: 0] += v
            countViewIds[c, default: [:]][id,default: 0] = v
        }
        let maxCreaterView = countView.values.max()!
        var ans = [[String]]()
        for (creater,view) in countView {
            guard view == maxCreaterView else {continue}
            guard let videos = countViewIds[creater] else {continue}
            var maxView = 0
            var minViewId = ""
            for (id,v) in videos {
                guard !minViewId.isEmpty else {
                    minViewId = id
                    maxView = v
                    continue
                }
                if v > maxView {
                    maxView = v
                    minViewId = id
                } else if v == maxView {
                    if minViewId > id {
                        minViewId = id
                    }
                }
            }
            ans.append([creater,minViewId])

        }
        return ans
    }
}