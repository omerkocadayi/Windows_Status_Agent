# This Python file uses the following encoding: utf-8
import sys
import csv
import pandas as pd
from pandas import DataFrame
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *

alertFile   = "alertFile.alert"
df = None

def setFrame():
    global df
    try:
        while(True):
            try:
                df = pd.read_csv('getData.csv', sep = ',')
                break
            except:pass
    except BaseException as error:
        try:
            global alertFile
            with open(alertFile, "a") as alertF:
                alertF.write("{} - _tW_setFrame - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
        except:
            pass
    return df

tell_row=1

class TableWidget(QTableWidget):
    def __init__(self, df, parent=None):
        QTableWidget.__init__(self, parent)
        self.df = df
        self.setRowCount(len(self.df.index))
        self.setColumnCount(len(self.df.columns))
        self.setHorizontalHeaderLabels(df.columns)
        self.setColumnWidth(0, 75);
        self.setColumnWidth(1, 100);
        self.setColumnWidth(2, 100);
        self.setColumnWidth(3, 250);
  
        self.updateFrame()  
        self.cellChanged.connect(self.onCellChanged)
        
    #@pyqtSlot(int, int)
    def onCellChanged(self, row, column):
        """
        text = self.item(row, column).text()
        self.df.set_value(row, column, text)
        """
    def updateFrame(self):
        try:
            while(True):
                self.df = setFrame()
                self.setRowCount(len(self.df.index))
                self.setColumnCount(len(self.df.columns))
                self.setHorizontalHeaderLabels(df.columns)
                for i in range(self.rowCount()):
                    for j in range(self.columnCount()):
                        x = self.df.iloc[i, j]
                        if type(x) != str:
                            x = str(x)
                        self.setItem(i, j, QTableWidgetItem(x))
                break        
        except BaseException as error:
            try:
                with open(alertFile, "a") as alertF:
                    alertF.write("{} - _tW_updateFrame - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
            except:
                pass
  
  
class App(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()
  
    def initUI(self):
        self.setGeometry(700, 150, 595, 600)
        df_rows = tell_row
        df_cols = 1
        self.df = setFrame()
        self.tableWidget = TableWidget(df, self)
  
        self.layout = QVBoxLayout()
        self.layout.addWidget(self.tableWidget)
        self.button = QPushButton('Export Processes to CSV', self)
        self.layout.addWidget(self.button)
        self.setLayout(self.layout)
        self.button.clicked.connect(self.writeCsv)
        
        self.show()
    
    @pyqtSlot()
    def print_my_df(self):
        fn, _ = QFileDialog.getSaveFileName(self, 'Save File', None, 'Excel Files (.xlsx);;All Files()')
        if fn != '':
            if QFileInfo(fn).suffix() == "": fn += '.xlsx'
        df.to_excel(fn, sheet_name='Result', index=False)
 
    def writeCsv(self):
        try:
            while(True):
                path, _ = QFileDialog.getSaveFileName(self, 'Save File', QDir.homePath() + "/export.csv", "CSV Files(*.csv *.txt)")
                if path:
                    with open(path, 'w') as stream:
                        print("saving", path)
                        writer = csv.writer(stream, delimiter='\t')
                        headers = []
                        for column in range(self.tableWidget.columnCount()):
                            header = self.tableWidget.horizontalHeaderItem(column)
                            if header is not None:
                                 headers.append(header.text())
                            else:
                                headers.append("Column " + str(column))
                        writer.writerow(headers)
                        for row in range(self.tableWidget.rowCount()):
                            rowdata = []
                            for column in range(self.tableWidget.columnCount()):
                                item = self.tableWidget.item(row, column)
                                if item is not None:
                                    rowdata.append(item.text())
                                else:
                                    rowdata.append('')
                            writer.writerow(rowdata)
                break
        except BaseException as error:
            try:
                global alertFile
                with open(alertFile, "a") as alertF:
                    alertF.write("{} - _tw_writeCsv - {}\n".format(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), error))
            except:
                pass
    
if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    sys.exit(app.exec_())
