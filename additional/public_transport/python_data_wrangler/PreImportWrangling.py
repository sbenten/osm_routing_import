import os
import sys
import string
import shutil
import time
import zipfile
import re


def main(args):
    displayHeader()
    sourcePath = getSourceZipFile()
    destPath = getDestinationFolder()
    doWrangle(sourcePath, destPath)

 
def displayHeader():
    print("===============================================================================")
    print("Python script to copy Traveline and NaPTAN data to the Postgresql data folder")
    print("Removes namespace declarations along the way, for simpler import via SQL")
    print("===============================================================================")
    print("\r\n")

def getSourceZipFile():
    var = input("Please specify the full path to the Traveline Zipfile:  ")
    if testFileExists(var.strip()):
        return var
    else:
        return getSourceZipFile()

def getDestinationFolder():
    var = input("Please specify the full path to the destination folder to unzip and wrangle the files:  ")
    #e.g. C:\Program Files\PostgreSQL\9.6\data
    if testFolderExists(var.strip()):
        return os.path.join(var, time.strftime("%Y%m%d%H%M%S"))
    else:
        return getDestinationFolder()

def testFileExists(sourcePath):
    return os.path.isfile(sourcePath)

def testFolderExists(sourcePath):
    return os.path.isdir(sourcePath)

def doWrangle(sourcePath, destPath):
    if checkProceed():
        unzipFile(sourcePath, destPath)
        processed = []

        for f in listXmlFiles(destPath):
            removeXmlNamepsace(f, destPath)
            processed.append(f)
        
        writeCsvResults(processed, destPath)

def checkProceed():
    var = input("Shall I unzip and wrangle the files? (y=Yes, n=No):  ")
    if var == "y":
        return True

def unzipFile(sourcePath, destPath):
    zip = zipfile.ZipFile(sourcePath, "r")
    zip.extractall(destPath)
    zip.close()

def listXmlFiles(destPath):
    files = []
    for f in os.listdir(destPath):
        if f.endswith(".xml"):
            files.append(f)
    return files

def removeXmlNamepsace(file, destPath):
    print("Processing " + file)
    fullPath = os.path.join(destPath, file)
    if testFileExists(fullPath):
        lines = []
        with open(fullPath, 'r') as f:            
            lines = f.readlines()
        
        #TODO Either traveline or naptan import, come up with a test that works.
        #     For now, uncomment as required
        #Traveline Schema
        #lines[1] = lines[1].replace('xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.transxchange.org.uk/ http://www.transxchange.org.uk/schema/2.1/TransXChange_general.xsd"', '')
        #lines[1] = lines[1].replace('xmlns="http://www.transxchange.org.uk/"', '')
        
        #NAPTAN Schema
        #The NAPTAN data is flattened into one line
        lines[0] = lines[0].replace('xmlns:xsi="http://www.w3.org/2001/XMLSchema"', '')
        lines[0] = lines[0].replace('xmlns="http://www.naptan.org.uk/"', '')
        lines[0] = lines[0].replace('xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"', '')
        lines[0] = lines[0].replace('xsi:schemaLocation="http://www.naptan.org.uk/ http://www.naptan.org.uk/schema/2.1/NaPTAN.xsd"', '')

        #NAPTAN line endings are a mess
        p = re.compile(r'><')
        breakLines = p.split(lines[0])
        lines = []

        for l in breakLines:
            if(l.startswith('<') == False):
                l = '<' + l
            if(l.endswith('>') == False):
                l = l + '>'
            lines.append(l)
       

        with open(fullPath, 'w') as f:
            f.writelines( lines )


def writeCsvResults(files, destPath):
    n = os.path.join(destPath, "import.csv")
    #first, change the array to include the destination directory, 
    #and pad with quotes so it can be easily used in an SQL array 
    stub = os.path.basename(destPath)
    pattern = "'{0}/{1}'"
    for i, file, in enumerate(files):
        files[i] = pattern.format(stub, file)

    if testFileExists(n):
        os.remove(n)
    w = open(n, "w")
    try:
        w.write(",".join(files))
    except Exception as e:
        print(traceback.format_exc(None))
        raise e
    finally:
        w.close()


if __name__ == "__main__":
    main(sys.argv)