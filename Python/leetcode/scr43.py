def str_to_int(str_num):
    dict_snums={'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9}
    int_multiplier=1
    int_num=0
    for chr_num in str_num[::-1]:
        int_num+=(dict_snums.get(chr_num)*int_multiplier)
        int_multiplier*=10
    return int_num

class Solution:
    def multiply(self, num1: str, num2: str) -> str:
        if num1 == 0 or num2 == 0:
            return "0"
        else:
            dict_nstrs={0:'0',1:'1',2:'2',3:'3',4:'4',5:'5',6:'6',7:'7',8:'8',9:'9'}
            int_product=str_to_int(num1)*str_to_int(num2)
            list_product=[]
            while True:
                # str_product+=dict_nstrs.get(((int_product%int_multiplier)-(int_product%(int_multiplier/10)))//(int_multiplier/10))
                list_product.insert(len(list_product),dict_nstrs.get(int_product%10))
                int_product=int_product//10
                if int_product==0:
                    break
            return "".join(list_product)[::-1]

obj_test = Solution()
print(obj_test.multiply('648383427', '93073533'))