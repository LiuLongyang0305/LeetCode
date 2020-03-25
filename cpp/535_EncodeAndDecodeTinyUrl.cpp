class Solution {
private:
    string alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    map<string, string > map;
public:

    // Encodes a URL to a shortened URL.
    string encode(string longUrl) {
        string key = getKey();
        while (map.find(key) != map.end()) {
            key = getKey();
        }
        map.insert(pair<string,string>(key,longUrl));
        return "http://tinyurl.com/" + key;
    }

    // Decodes a shortened URL to its original URL.
    string decode(string shortUrl) {
        return map.at(shortUrl.substr(shortUrl.size() - 6,6));
    }

private:
    string  getKey() {
        string key = "";
        for (int i = 0; i < 6; ++i) {
            key = key + alphabet.at(rand() % 62);
        }
        return key;
    }
};

// Your Solution object will be instantiated and called as such:
// Solution solution;
// solution.decode(solution.encode(url));