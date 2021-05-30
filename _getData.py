# This Python file uses the following encoding: utf-8
import sys
import time
import psutil
import pandas as pd

timeout = time.time() + 20
alertFile   = "alertFile.alert"

while (True):
    try:
        pids    = psutil.pids()
        procs   = []
        for pid in pids:
            try:
                temp = psutil.Process(pid)
                if len(temp.exe()) == 0:
                    procs.append([str(pid),temp.name(),temp.status(),"---"])
                else:procs.append([str(pid),temp.name(),temp.status(),str(temp.exe())])
                
            except:pass
        df = pd.DataFrame(data=procs, columns=['Pid','Name','Status','ExePath'])
        time.sleep(3)
        if time.time() > timeout:
            break
        df.to_csv (r'getData.csv', index = False, header=True)
    except:
        try:
            with open(alertFile, "a") as alertF:
                alertF.write("{} - get_size - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
        except:
            pass
sys.exit(0)
