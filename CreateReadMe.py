import os

path = "/Users/liulongyang/Documents/GitHub/LeetCode/swift"
dir_names = ['Tree', 'Hash', 'Array', 'UnionFind', 'LinkedList', 'BinarySearch', 'Graph', 'Math', 'Trie', 'Heap',
             'Greedy', 'String', 'Stack', 'DynamicProgramming', 'Contest','Backtracking','BitMapipulation','BreadFirstSearch','DFS','Sort']
file_path = '/Users/liulongyang/Documents/GitHub/LeetCode/README.md'
websites = 'https://github.com/LiuLongyang0305/LeetCode/tree/master/swift/'
with open(file_path, 'w') as read_me:
    read_me.write('# swift\n')
    read_me.write('\n')
    for dir_name in dir_names:

        print "************   " + dir_name  + "  *******   "
        read_me.write('## ' + dir_name + '\n')
        read_me.write('\n')

        current_path = path + '/' + dir_name
        file_names = os.listdir(current_path)
        current_website = websites + dir_name + '/'
        read_me.write('|#Number|Solution|\n')
        read_me.write('|:--|:----|\n')
        dic = {0: ' '}
        for file_name in file_names:
            parts = file_name.split('_')
            # name = parts[1]
            name = file_name
            number = parts[0]
            dic[int(number)] = name
        dic_keys_sorted = sorted(dic.keys())
        for key in dic_keys_sorted:
            if key == 0:
                continue
            file_name = dic.get(key)
            parts = file_name.split('_')

            web = current_website + file_name
            label = '[' + parts[1] + '](' + web + ')'
            read_me.write('|' + parts[0] + '|' + label + '|\n')

        read_me.write('\n')

