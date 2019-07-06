//https://leetcode.com/problems/video-stitching/
class Solution {
    func videoStitching(_ clips: [[Int]], _ T: Int) -> Int {
        var dp = Array<Int>(repeating: -1 , count: T + 1)
        let clipsCopy = clips.sorted { (first, second) -> Bool in
            first[0] < second[0]
        }
        //Video doesn't start from 0
        if clipsCopy[0][0] != 0 {
            return -1
        }
        
        //Place the first video clip
        for i in 0...min(clipsCopy[0][1], T) {
            dp[i] = 1
        }
        
        for i in 1..<clipsCopy.count {
            let currentClip = clipsCopy[i]

            //The clip start time > the time we wanted
            if currentClip[0] > T {
                continue
            }

            //Some gap exist
            if dp[currentClip[0]] == -1 {
                return -1
            }

            //Update. states
            for j in currentClip[0]...currentClip[1] {
                if j > T {
                    break
                } else if currentClip[0] == 0 {
                    dp[j] =  1
                } else if dp[j] == -1 {
                    dp[j] = dp[currentClip[0]] + 1
                } else {
                    dp[j] = min(dp[j], dp[currentClip[0]] + 1)
                }
            }
        }
        return dp[T]
    }
}

