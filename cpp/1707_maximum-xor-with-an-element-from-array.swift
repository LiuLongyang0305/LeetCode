// https://leetcode.com/problems/maximum-xor-with-an-element-from-array/
class Trie {
    Trie *left;//0
    Trie *right;//1
public:
    Trie() : left(nullptr), right(nullptr) {}

    void insert(int val) {
        Trie *curRoot = this;
        for (int i = 29; i >= 0; i--) {
            int bit = (val >> i) & 1;
            if (bit) {
                if (nullptr == curRoot->right) {
                    curRoot->right = new Trie();
                }
                curRoot = curRoot->right;
            } else {
                if (nullptr == curRoot->left) {
                    curRoot->left = new Trie();
                }
                curRoot = curRoot->left;
            }
        }
    }

    int getMaxXor(int val) {
        int ans = 0;
        Trie *curRoot = this;
        for (int i = 29; i >= 0; i--) {
            int bit = (val >> i) & 1;
            if (bit) {
                if (nullptr != curRoot->left) {
                    ans |= (1 << i);
                    curRoot = curRoot->left;
                } else {
                    curRoot = curRoot->right;
                }
            } else {
                if (nullptr != curRoot->right) {
                    ans |= (1 << i);
                    curRoot = curRoot->right;
                } else {
                    curRoot = curRoot->left;
                }
            }
        }
        return ans;
    }
};

class Solution {
public:
    vector<int> maximizeXor(vector<int> &nums, vector<vector<int>> &queries) {
        sort(nums.begin(), nums.end());
        const int M = nums.size();
        const int N = queries.size();
        for (int i = 0; i < N; ++i) {
            queries[i].push_back(i);
        }
        sort(queries.begin(), queries.end(), [](auto &x, auto &y) {
            return x[1] < y[1];
        });
        vector<int> ans = vector<int>(N, 0);

        int numIdx = 0;
        Trie *trie = new Trie();

        for (auto &query : queries) {
            while (numIdx < M && nums[numIdx] <= query[1]) {
                trie->insert(nums[numIdx]);
                numIdx++;
            }
            ans[query[2]] = numIdx == 0 ? -1 : trie->getMaxXor(query[0]);
        }
        return ans;
    }
};