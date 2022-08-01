import os
import sys
import subprocess
import json
from tkinter import *
from tkinter import ttk
import tkinter.filedialog as filedialog
from PIL import ImageTk, Image
import shutil
from zipfile import ZipFile
cd = str(os.path.realpath(__file__).replace("\\parser.py","",1))
def open_file():
	file = filedialog.askopenfile(mode='r', filetypes=[('Bilddokumente öffnen', '*.oid')])
	if file:
		filepath = os.path.abspath(file.name)
		return filepath
ZipFile(open_file()).extractall(cd)
file=open('FILE.json')
data=json.load(file)
for i in data['OID']:
	print(i)
folder=data['OID'][0]['STORAGE']
images=data['OID'][0]['MEDIA']
name=data['OID'][0]['NAME']
for i in images:
	print(i)
file.close
win = Tk()
win.geometry("700x450")
win.title(str(name)+".OID - Open Image Document")
win.iconbitmap('.\OIDLogo.ico')
bg = ImageTk.PhotoImage(file=folder+"\\"+images[0])
canvas = Canvas(win, width=700, height=3500)
canvas.pack(fill=BOTH, expand=True)
canvas.create_image(0, 0, image=bg, anchor='nw')
def resize_image(e):
	global image, resized, image2
	#bg.delete()
	image = Image.open(folder+"\\"+images[0])
	resized = image.resize((e.width, e.height), Image.ANTIALIAS)
	image2 = ImageTk.PhotoImage(resized)
	canvas.create_image(0, 0, image=image2, anchor='nw')
win.bind("<Configure>", resize_image)
win.mainloop()
os.system("del /f \""+f"{cd}\\MEDIA\\{images[0]}"+"\"")
os.system("del /f \""+f"{cd}\\FILE.json"+"\"")