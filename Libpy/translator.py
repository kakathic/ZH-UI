from time import sleep, perf_counter
from re import sub, UNICODE
from os import listdir, path, remove
from threading import Thread
from googletrans import Translator
tr = Translator()

def colors( n ):
    return "\033[%sm" % (n)

red = colors(91)
green = colors(92)
yellow = colors(93)
pink = colors(95)
cyan = colors(96)
white = colors(0)

def processing():
    for i in range(10):
        print("     [%s]" % (f"{i*' '}▬▬▬▬▬{(10-i)*' '}"), end="\r")
        sleep(0.05)
    for i in range(10, 0, -1):
        print("     [%s]" % (f"{i*' '}▬▬▬▬▬{(10-i)*' '}"), end="\r")
        sleep(0.05)

def translator(m):
    return f" {tr.translate(m.group(), dest=lang).text} "

def trans(file, i):
    s = i.replace("\n", "").replace("	", "    ")
    translated = sub(r'[\u4e00-\u9fff]+', translator, s, UNICODE)
    with open(f"./output/{file[:file.find('.xml')]}_{lang}.xml", "a") as f:
        f.write(translated.replace("  ", " "))
        f.write("\n")

def Input():
    for file in files:
        if path.isfile(f"./output/{file[:file.find('.xml')]}_{lang}.xml"):
            remove(f"./output/{file[:file.find('.xml')]}_{lang}.xml")
        print(f"   » Translating {file}")
        time_start = perf_counter()
        with open(f"./input/{file}") as f:
            line = f.readlines()
            for i in range(len(line)):
                print(f"{20*' '} %s{round(100/len(line)*(i+1), 2):>7} %%%s" % (yellow, white), end="\r")
                if line[i].strip() != "" or '://' not in line[i]:
                    thread = Thread(target = trans, args=(file, line[i]))
                    thread.start()
                    thread.join()
                continue
        time_stop = int(round(perf_counter() - time_start, 2))
        print(f"    ↳ Successful with %s{time_stop}s%s" % (green, white)+ 20*" ", end = "\n\n")

files = listdir("./input")
title = f"Theme Translator {pink}v2.0"
author = f"Author: {cyan}Phong Jocker"

print("\033c", end="\r")
print(f"   ╔{40*'═'}╗")
print("   ║%s%{}s%s%{}s║".format(20+(len(title)+7)//2, 20-(len(title)-3)//2) % (yellow, title, white, " " ))
print("   ║%{}s%s%{}s║".format(20+(len(author)+8)//2, 20-(len(author)-2)//2) % (author, white, " "))
print(f"   ╚{40*'═'}╝", end="\n\n")

print("""   Translate from Chinese to:
   1. Vietnamese
   2. English
""")
lang = int(input("   Your choice: "))
if lang == 1:
    lang = "vi"
elif lang == 2:
    lang = "en"
else:
    print(f"{red}   Just 1 or 2.{white}")
    exit()

if len(files) == 0:
    print(f"{red}   Don't have any file in 'Input' folder to translate.{white}")
else:
    print()
    thread1 = Thread(target = Input)
    thread1.start()

    while thread1.is_alive():
        processing()
    print(f"   Successful translate from Chinese to {cyan}{'Vietnamese' if lang == 'vi' else 'English'}{white}")
    print("     ➥ File translated at 'Output' folder.")
