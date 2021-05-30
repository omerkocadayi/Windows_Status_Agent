import os
import time
os.system("curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py")
os.system("python get-pip.py")
reqList = None
with open("_requirements.txt","r") as reqList:
    reqList = reqList.readlines()
for i in reqList:
    print(i)
    os.system("pip install {}".format(i))
    time.sleep(1)

