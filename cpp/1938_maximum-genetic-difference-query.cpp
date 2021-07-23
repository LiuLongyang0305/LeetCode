// https://leetcode.com/problems/maximum-genetic-difference-query/
using namespace std;
const int maxBitsLength = 18;
class Trie {
    Trie *left;//0
    Trie *right;//1
    int cnt;
public:
    Trie() : left(nullptr), right(nullptr),cnt(0) {}

    void insert(int val) {
        Trie *curRoot = this;
        for (int i = maxBitsLength; i >= 0; i--) {
            int bit = (val >> i) & 1;
            if (bit) {
                if (nullptr == curRoot->right) {
                    curRoot->right = new Trie();
                }
                curRoot->right->cnt += 1;
                curRoot = curRoot->right;
            } else {
                if (nullptr == curRoot->left) {
                    curRoot->left = new Trie();
                }
                curRoot->left->cnt += 1;
                curRoot = curRoot->left;
            }
        }
    }

    int getMaxXor(int val) {
        int ans = 0;
        Trie *curRoot = this;
        for (int i = maxBitsLength; i >= 0; i--) {
            int bit = (val >> i) & 1;
            if (bit) {
                if (nullptr != curRoot->left && curRoot->left->cnt > 0) {
                    ans |= (1 << i);
                    curRoot = curRoot->left;
                } else {
                    curRoot = curRoot->right;
                }
            } else {
                if (nullptr != curRoot->right && curRoot->right->cnt > 0) {
                    ans |= (1 << i);
                    curRoot = curRoot->right;
                } else {
                    curRoot = curRoot->left;
                }
            }
        }
        return ans;
    }

    void remove(int val) {
        Trie* node = this;
        for (int i = maxBitsLength; i >= 0; i--) {
            int bit = (val >> i) & 1;
            if (bit) {
                node->right->cnt -= 1;
                node = node->right;
            } else {
                node->left->cnt -= 1;
                node = node->left;
            }
        }
    }
};

class Solution {
private:
    vector<vector<int>> tree;
    vector<vector<pair<int,int>>> queriesMap;
    vector<int> ans;
    Trie* trie = nullptr;
    void dfs(int root) {
        this->trie->insert(root);
        for(auto p : this->queriesMap[root]) {
            ans[p.first] = trie->getMaxXor(p.second);
        }
        for(int r: tree[root]) {
            dfs(r);
        }
        this->trie->remove(root);
    }
public:
    vector<int> maxGeneticDifference(vector<int>& parents, vector<vector<int>>& queries) {
        const int N = parents.size();
        const int M = queries.size();
        this->tree.clear();
        this->queriesMap.clear();
        this->tree.resize(N);
        this->queriesMap.resize(N);
        this->ans.clear();
        this->ans.resize(M);
        this->trie = new Trie();
        int root = -1;
        for (int i = 0; i < N; ++i) {
            if(parents[i] == -1) {
                root = i;
            } else {
                this->tree[parents[i]].push_back(i);
            }
        }
        for (int i = 0; i < M; ++i) {
            this->queriesMap[queries[i][0]].push_back(make_pair(i,queries[i][1]));
        }
        dfs(root);
        return  ans;
    }
};


