// https://leetcode.com/problems/tweet-counts-per-frequency/
class TweetCounts {
    private enum Frequency: String {
        case day
        case minute
        case hour
        
        var seconds : Int {
            switch self {
            case .day:
                return 60 * 60 * 24
            case .minute:
                return 60
            case .hour:
                return 60 * 60
            }
        }
    }
    
    private var records = [String:[Int]]()
    init() {
        
    }
    
    func recordTweet(_ tweetName: String, _ time: Int) {
        records[tweetName,default: [Int]()].append(time)
    }
    
    func getTweetCountsPerFrequency(_ freq: String, _ tweetName: String, _ startTime: Int, _ endTime: Int) -> [Int] {
        guard let times = records[tweetName], !times.isEmpty else {
            return []
        }
        let frequency = Frequency(rawValue: freq)!.seconds
        var ans = Array<Int>(repeating: 0, count: (endTime - startTime) / frequency + 1)
        for time in times where time >= startTime && time <= endTime {
            ans[(time - startTime) / frequency] += 1
        }
        return ans
    }
 }
/**
 * Your TweetCounts object will be instantiated and called as such:
 * let obj = TweetCounts()
 * obj.recordTweet(tweetName, time)
 * let ret_2: [Int] = obj.getTweetCountsPerFrequency(freq, tweetName, startTime, endTime)
 */