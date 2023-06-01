class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if numRows == 1:
            return s
        list_builder=[]
        bool_xadd=False
        for int_temp in range(numRows):
            [list_builder.append(a) for a in [['']*((len(s)//2)+1)]]
        x, y = 0, 0
        int_ctr=0
        while int_ctr < len(s):
            list_builder[x][y]=s[int_ctr]
            if bool_xadd == False:
                x+=1
                bool_xadd = True if x == numRows-1 else False
            else:
                x-=1
                y+=1
                bool_xadd = False if x == 0 else True
            int_ctr+=1
        return "".join(["".join(a) for a in list_builder])
str1='PAYPALISHIRING'
obj_Solution = Solution()
print(obj_Solution.convert(str1, 3))