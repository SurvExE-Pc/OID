import os
import sys
import subprocess
import json
from tkinter import *
from tkinter import ttk
import tkinter.filedialog as filedialog
from PIL import ImageTk, Image
import shutil
from zipfile import *
import time
cd = str(os.path.realpath(__file__).replace("\\NewOID.py","",1))
filesavedir=filedialog.askdirectory()
print(filesavedir)
filename=str(input("File name(without the .oid): \n"))
filenamedisp=str(filename)+".oid"
def open_file():
	file = filedialog.askopenfile(mode='r', filetypes=[('Image files', '*.tiff;*.tif;*.bmp;*.jpg;*.jpeg;*.gif;*.png;*.raw')])
	if file:
		filepath = os.path.abspath(file.name)
		return filepath
image=open_file()
done=False
try:
	os.system("mkdir .\MEDIA")
except:
	print("dir was already made")
finally:
	print("mkdir done")
	done=True
	shutil.copyfile(image, f"{cd}\\MEDIA\\img1.jpg")
create = open(f"{cd}\\FILE.json", "w+")
create.close()
FILE = open(f"{cd}\\FILE.json", "w")
FILE.write('{\n	"OID": [\n		{\n			"STORAGE": "MEDIA",\n			"MEDIA": ["img1.jpg"],\n			"NAME": '+"\""+filename+"\""+'\n		}\n	]\n}')
FILE.close()
import zipfile
zipfile.main(['-c', filenamedisp, f'{cd}\\FILE.json', f'{cd}\\MEDIA'])
shutil.copyfile(f"{cd}\\{filenamedisp}",filesavedir+"\\"+filenamedisp)
time.sleep(0.1)
os.remove(f"{cd}\\{filenamedisp}")
os.remove(f"{cd}\\FILE.json")
os.remove(f"{cd}\\MEDIA\\img1.jpg")
input("Done!\nPress enter to exit.\n")