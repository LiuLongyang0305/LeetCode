// https://leetcode.com/problems/construct-quad-tree/
class Node {
public:
    bool val;
    bool isLeaf;
    Node* topLeft;
    Node* topRight;
    Node* bottomLeft;
    Node* bottomRight;

    Node() {}

    Node(bool _val, bool _isLeaf, Node* _topLeft, Node* _topRight, Node* _bottomLeft, Node* _bottomRight) {
        val = _val;
        isLeaf = _isLeaf;
        topLeft = _topLeft;
        topRight = _topRight;
        bottomLeft = _bottomLeft;
        bottomRight = _bottomRight;
    }
};

class Solution {
private:
    vector<vector<int>> grid;
public:
    Node* construct(vector<vector<int>>& grid) {
        this->grid = grid;
        return construct(0,0,grid.size());
    }

private:
    Node* construct(int left, int up,int length) {
        bool flag = isLeaf(left,up,length);
        if(flag) {
            return  new Node(grid[up][left], true,NULL,NULL,NULL,NULL);
        }
        Node* node = new Node();
        node->isLeaf = false;
        int nextLength = length >> 1;
        node->topLeft = construct(left,up,nextLength);
        node->topRight = construct(left + nextLength,up,nextLength);
        node->bottomLeft = construct(left,up + nextLength,nextLength);
        node->bottomRight = construct(left + nextLength,up + nextLength, nextLength);
        return node;
    }

    bool isLeaf(int left, int up, int length) {
        if (length == 1) {
            return true;
        }
        int  last = grid[up][left];
        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                if (last != grid[up + i][left + j]) {
                    return false;
                }
            }
        }
        return true;
    }
};