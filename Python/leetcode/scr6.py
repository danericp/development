# THIS CODE IS NOT YET COMPLETE
class Solution:
    def convert(self, s: str, numRows: int) -> str:
        list_builder=[]
        int_ctr=0
        bool_xadd=False
        while int_ctr <= len(s):
            list_builder.append((','*(numRows-1)).split(','))
            int_ctr+=numRows
        x, y = 0, numRows-1
        while int_ctr < len(s):
            list_builder[x][y]=s[int_ctr]
            if bool_xadd == False:
                y-=1
                bool_xadd = True if y == 0 else False
            else:
                x+=1
                y+=1
                bool_xadd = False if y == numRows-1 else True
            int_ctr+=1
        print(list_builder)
        return "asd"

'''

P  I  N
A LS IG
YA HR
P  I

[
    ['N', 'H', 'A', 'P'], 
    [' ', 'A', ' ', ' '], 
    [' ', ' ', 'P', ' '], 
    ['I', 'I', 'S', 'L']
]

14//4=3

14          P
13          A
12          Y
11          P
32          A
53          L
74          I
73          S
72          H
71          I
92          R
11,3        I
13,4        N
13,3        G

'''
