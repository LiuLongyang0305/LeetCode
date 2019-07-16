
//https://leetcode.com/problems/design-twitter/
class Twitter {
    private struct Tweet {
        var userId: Int
        var time: Int
        var id: Int
    }
    private var follows = Dictionary<Int,Set<Int>>()
    private var tweets = [Tweet]()
    private var time: Int = 0
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        validateUser(userId: userId)
        tweets.append(Twitter.Tweet(userId: userId, time: time, id: tweetId))
        time += 1
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
        validateUser(userId: userId)
        var tweetPostbyIds = follows[userId]!
        tweetPostbyIds.insert(userId)
        var  ans = [Int]()
        var  i = tweets.count - 1
        while i >= 0 {
            let tweet = tweets[i]
            if tweetPostbyIds.contains(tweet.userId) {
                ans.append(tweet.id)
                if ans.count == 10 {
                    return ans
                }
            }
            i -= 1
        }
        return ans
    }
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        validateUser(userId: followerId)
        validateUser(userId: followeeId)
        if followeeId == followerId {
            return
        }
        follows[followerId]?.insert(followeeId)
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        validateUser(userId: followerId)
        validateUser(userId: followeeId)
        follows[followerId]?.remove(followeeId)
    }
    
    private func validateUser(userId: Int) {
        if nil == follows[userId] {
            follows[userId] = Set<Int>()
        }
    }
}


/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */