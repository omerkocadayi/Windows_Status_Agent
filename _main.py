# This Python file uses the following encoding: utf-8
import math
import subprocess
import numpy as np
import datetime as dt
import os, sys, platform
import psutil, GPUtil, cpuinfo
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtGui import QGuiApplication, QIcon
from PySide2.QtCore import QObject, Slot, Signal, QTimer
from apscheduler.schedulers.background import BackgroundScheduler

alertFile, pwd, loginEvents = "alertFile.alert", os.getcwd().replace("\\","/"), None

powershellScript  = """$query = Get-WinEvent -path C:\Windows\system32\winevt\Logs\Security.evtx 
| Where {$_.id -eq "4648"} | select -First 5; 
$result=($query | Select-Object TimeCreated)+($query | 
Foreach {([xml]$_.ToXml()).GetElementsByTagName("Data").ItemOf(1)} | 
Select -ExpandProperty "#text"); $result | Out-File -encoding ASCII """+pwd+"""/getEvents.txt; [Environment]::Exit(0)
"""

cmdScript = """powershell.exe "Start-Process powershell -ArgumentList '
-ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile 
-File """+pwd+"""/getEvents.ps1' -Verb RunAs -WindowStyle Hidden"
"""

def get_size(size_bytes):
    try:
        if size_bytes == 0:
            return "0B"
        size_name = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
        i = int(math.floor(math.log(size_bytes, 1024)))
        p = math.pow(1024, i)
        s = round(size_bytes / p, 2)
        return "%s %s" % (s, size_name[i])
    
    except BaseException as error:
        try:
            global alertFile
            with open(alertFile, "a") as alertF:
                alertF.write("{} - _main_get_size - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
        except:
            pass

get_cpu_info, cpu_count_false, cpu_count_true, cpu_freq_max, total_vram = None, None, None, None, None
cpu_freq_min, total_ram, gpu_model, os_info, host_info, total_disk      = None, None, None, None, None, None

def staticSystemInfos():
    global get_cpu_info, cpu_count_false, cpu_count_true, cpu_freq_max, total_vram
    global cpu_freq_min, total_ram, gpu_model, os_info, host_info, total_disk, alertFile

    try:
        svmen       = psutil.virtual_memory()
        gpus        = GPUtil.getGPUs()
        cpufreq     = psutil.cpu_freq()
        disk_usage  = psutil.disk_usage('/')
        uname       = platform.uname()
            
        get_cpu_info    = cpuinfo.get_cpu_info()['brand_raw']
        cpu_count_false = str(psutil.cpu_count(logical=False))
        cpu_count_true  = str(psutil.cpu_count(logical=True))
        cpu_freq_max    = f"{cpufreq.max:.2f} Mhz"
        cpu_freq_min    = f"{cpufreq.min:.2f} Mhz"
        total_ram       = get_size(svmen.total)
        gpu_model       = gpus[0].name
        total_vram      = f"{gpus[0].memoryTotal} MB"
        total_disk      = f"{get_size(disk_usage.total)}"
        os_info, host_info = f" {uname.system} {uname.release}  -  v{uname.version}\t" , f" {uname.node}"

    except BaseException as error:
        try:
            with open(alertFile, "a") as alertF:
                alertF.write("{} - _main_staticSystemInfos - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
        except:
            pass
        
def getEvents():
    global alertFile, powershellScript, cmdScript
    try:
        with open("getEvents.ps1", "w") as ps1:
            ps1.write(powershellScript.replace("\n",""))

        _cmdScript = subprocess.Popen(cmdScript.replace("\n",""), shell=True)
        _setDataPy = subprocess.Popen("python _getData.py", shell=True)
        
    except BaseException as error:
        try:
            with open(alertFile, "a") as alertF:
                alertF.write("{} - _main_getEvents - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
        except:
            pass

def to_matrix(l, n):
    return [l[i:i+n] for i in range(0, len(l), n)]
            
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        timer = QTimer(self)
        timer.start(750)
        timer.timeout.connect(lambda: self.setDynamicInfo())

        timer2 = QTimer(self)
        timer2.start(3000)
        timer2.timeout.connect(lambda: self.showApps())
        timer2.timeout.connect(lambda: self.loginInfos())

    showPercentage = False

    percentageCPU       = Signal(float)
    percentageRAM       = Signal(float)
    percentageGPU       = Signal(float)
    percentageDisk      = Signal(float)
    cpuFrequencyCurrentInfo = Signal(str)
    ramAvailableInfo    = Signal(str)
    ramUsedInfo         = Signal(str)
    vramFreeInfo        = Signal(str)
    vramUsedInfo        = Signal(str)
    gpuTempInfo         = Signal(str)
    diskFreeInfo        = Signal(str)
    diskUsedInfo        = Signal(str)

    cpuInfo             = Signal(str)
    cpuPhysicalCoresInfo= Signal(str)
    cpuTotalCoresInfo   = Signal(str)
    cpuFrequencyMaxInfo = Signal(str)
    cpuFrequencyMinInfo = Signal(str)
    ramTotalInfo        = Signal(str)
    gpuModelInfo        = Signal(str)
    vramTotalInfo       = Signal(str)
    diskTotalInfo       = Signal(str)
    osInfo              = Signal(str)
    hostNameInfo        = Signal(str)
    showService         = Signal(str)
    showApp             = Signal(str)
    loginInfo           = Signal(list)
    
    def loginInfos(self):
        global loginEvents
        if os.path.isfile('getEvents.txt'):
            with open("getEvents.txt", "r") as events:
                data = events.readlines()
                data = data[3:13]
                for i in range(10):data[i] = str(data[i]).replace("\n","") 
                for i in range(5):data.append("Oturum Açma İşlemi Başarılı !")
        else:
            data = [None] * 15
            for i in range(15):data[i] = "---"
        self.loginInfo.emit(data)
        
    @Slot(str)
    def showServices(self, name):
        tableWidget = "python _tableWidget.py"
        tableWidget = subprocess.Popen(tableWidget, shell=True)
        setDataPy   = "python _getData.py"
        setDataPy   = subprocess.Popen(setDataPy, shell=True)
        self.showService.emit(name)

    def showApps(self):
        import winreg

        def foo(hive, flag):
            aReg = winreg.ConnectRegistry(None, hive)
            aKey = winreg.OpenKey(aReg, r"SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
                                  0, winreg.KEY_READ | flag)
            
            count_subkey = winreg.QueryInfoKey(aKey)[0]
            software_list = []

            for i in range(count_subkey):
                software = {}
                try:
                    asubkey_name = winreg.EnumKey(aKey, i)
                    asubkey = winreg.OpenKey(aKey, asubkey_name)
                    software['name'] = winreg.QueryValueEx(asubkey, "DisplayName")[0]

                    try:
                        software['version'] = winreg.QueryValueEx(asubkey, "DisplayVersion")[0]
                    except EnvironmentError:
                        software['version'] = 'undefined'
                    try:
                        software['publisher'] = winreg.QueryValueEx(asubkey, "Publisher")[0]
                    except EnvironmentError:
                        software['publisher'] = 'undefined'
                    software_list.append(software)
                except EnvironmentError:
                    continue

            return software_list

        software_list = foo(winreg.HKEY_LOCAL_MACHINE, winreg.KEY_WOW64_32KEY) + foo(winreg.HKEY_LOCAL_MACHINE, winreg.KEY_WOW64_64KEY) + foo(winreg.HKEY_CURRENT_USER, 0)
        i = 1
        result = ""
        for software in software_list:
            result += ' %s)%s Name=%s, Version=%s, Publisher=%s\n' % (i, (5-len(str(i)))*" ", software['name'], software['version'], software['publisher'])
            if i<52:i+=1
            else:break
        self.showApp.emit(result)
    
    def setDynamicInfo(self):
        global get_cpu_info, cpu_count_false, cpu_count_true, cpu_freq_max, cpu_freq_min, total_ram, gpu_model, os_info, host_info

        try:
            if self.showPercentage:
                svmen = psutil.virtual_memory()
                gpus = GPUtil.getGPUs()
                cpufreq = psutil.cpu_freq()
                disk_usage = psutil.disk_usage('/')

                self.percentageCPU.emit(psutil.cpu_percent())
                self.percentageRAM.emit(svmen.percent)
                self.percentageGPU.emit(gpus[0].load*100)
                self.percentageDisk.emit(disk_usage.percent)
            
                self.cpuFrequencyCurrentInfo.emit(f"{cpufreq.current:.2f} Mhz")

                self.ramAvailableInfo.emit(get_size(svmen.available))
                self.ramUsedInfo.emit(get_size(svmen.used))

                self.vramFreeInfo.emit(f"{gpus[0].memoryFree} MB")
                self.vramUsedInfo.emit(f"{gpus[0].memoryUsed} MB")
                self.gpuTempInfo.emit(f"{gpus[0].temperature} ºC")
                
                self.diskFreeInfo.emit(f"{get_size(disk_usage.free)}")
                self.diskUsedInfo.emit(f"{get_size(disk_usage.used)}")
                
            self.cpuInfo.emit(get_cpu_info)
            self.cpuPhysicalCoresInfo.emit(cpu_count_false)
            self.cpuTotalCoresInfo.emit(cpu_count_true)
            self.cpuFrequencyMaxInfo.emit(cpu_freq_max)
            self.cpuFrequencyMinInfo.emit(cpu_freq_min)
            self.ramTotalInfo.emit(total_ram)
            self.gpuModelInfo.emit(gpu_model)
            self.vramTotalInfo.emit(total_vram)
            self.diskTotalInfo.emit(total_disk)

        except BaseException as error:
            try:
                with open(alertFile, "a") as alertF:
                    alertF.write("{} - _main_setDynamicInfo - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
            except:
                pass

    @Slot()
    def setStaticInfo(self):
        try:
            global get_cpu_info, cpu_count_false, cpu_count_true, cpu_freq_max, cpu_freq_min, total_ram, gpu_model, os_info, host_info

            self.cpuInfo.emit(get_cpu_info)
            self.cpuPhysicalCoresInfo.emit(cpu_count_false)
            self.cpuTotalCoresInfo.emit(cpu_count_true)
            self.cpuFrequencyMaxInfo.emit(cpu_freq_max)
            self.cpuFrequencyMinInfo.emit(cpu_freq_min)
            self.ramTotalInfo.emit(total_ram)
            self.gpuModelInfo.emit(gpu_model)
            self.vramTotalInfo.emit(total_vram)
            self.diskTotalInfo.emit(total_disk)
            self.osInfo.emit(os_info)
            self.hostNameInfo.emit(host_info)

            def showValues():
                self.showPercentage = True

            QTimer.singleShot(20, showValues)
            
        except BaseException as error:
            try:
                with open(alertFile, "a") as alertF:
                    alertF.write("{} - _main_setStaticInfo - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
            except:
                pass
            
scheduler = BackgroundScheduler()
scheduler.add_job(staticSystemInfos, 'interval', minutes=15, id='InfosCron')
scheduler.add_job(getEvents, 'interval', minutes=10, id='EventsCron')
scheduler.start()

    
if __name__ == "__main__":
    getEvents()
    staticSystemInfos()
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)
    app.setWindowIcon(QIcon("icon.ico"))
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
