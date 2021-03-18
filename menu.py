import os,sys,time
def bersih():
    os.system("clear")

def menu():
    bersih()
    print("")
    os.system("clear")
    print('\033[1;36m<===============\033[1;37m{\033[1;>
    print('')
    os.system('date | lolcat')
    print("\033[1;93m")
    print(" \033[1;34m<<<<<<<<<<<<<<<<\033[1;37m{\033[1>
    print "+-------------------------------+"
    print "Author : Trey.Killer-Anonymous"
    print "Youtube : Noel Qeen"
    print "Facebook :Trey.Killer"
    print "Instagram : lx_m3n96"
    print "Github : https://github.com/Trey-Killer"
    print "+-------------------------------+"
    print "Menu"
    print "[1] Open CRACK"
    print "[2] Open FB-Cracker"
    print "[3] Open fbtarget"
    print "[4] Open BlackMafiaTool"
    print "[5] Open Crekv3"
    print "[6] Open igtools"
    print "[7] Open Report3"
    print "[0] Exit/Keluar"
    pil = raw_input("Masukan Nomor ~> ")
    if pil =="1":
       os.system("python2 login1.py")
    elif pil =="2":
       os.system("python2 login2.py")
    elif pil =="3":
       os.system("python2 login3.py")
    elif pil =="4":
       os.system("python2 login4.py")
    elif pil =="5":
       os.system("python2 logCrekv3.py")
    elif pil =="6":
        os.system("python2 login6.py")
    elif pil =="7":
        os.system("python2 login7.py")
    elif pil =="0":
        sys.exit()
menu()
