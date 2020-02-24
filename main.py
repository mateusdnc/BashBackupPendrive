from tkinter import *
from tkinter import ttk
import subprocess
from sultan.api import Sultan
s = Sultan() 
root = Tk()


    



class Application(Frame):
    def __init__(self, master=None):
        Frame.__init__(self, master)
       
        # #Principal
        # containermain = Frame(master)
        # containermain.pack ()

        #Containers Seção 1      
        container1 = Frame(master,borderwidth=2, relief="groove")
        container1.pack (fill=X,pady=10,padx=5)


        container1_child1 = Frame(container1)
        container1_child1.pack ()


        container1_child2 = Frame(container1)
        container1_child2.pack ()

        #Containers Seção 2

    #     container2 = Frame(master,height = 200,borderwidth=2, relief="groove")
    #    # container2.place(relx=0.5, rely=0.5, anchor=CENTER)
    #     container2.pack (fill=X,padx=5)

        #Containers Seção 3
        container3 = Frame(master,height = 200,borderwidth=2, relief="groove")
        container3.pack (fill=X,padx=5,pady=5)
      
      
        #Containers Seção 4

        # container4 = Frame(master)
        # container4.pack (pady=10)

        #Texts
        text1 = Label(container1_child1, text="Diretorios",)
        text1.pack ()

        text2 = Label(container1_child1, text="Caminho do backup local",)
        text2.pack (side=LEFT)

        text3 = Label(container1_child2, text="Caminho pendrive",)
        text3.pack (side=LEFT)

        ####

        # text3 = Label(container2, text="Opções")
        # text3.pack ()



        #Entrys
        localbackup = Entry(container1_child1)
        localbackup.pack (side=RIGHT)

        localpendrive = Entry(container1_child2)
        localpendrive.pack (side=RIGHT)


        #ComboBox,Text | Container 3

        text4 = Label(container3,text="Dispositivo")
        text4.pack ()
        
       # label[]=subprocess.call(" lsblk --output LABEL,UUID,MOUNTPOINT | awk 'NF'",shell=True)

        dispositivo=[]
        #numerodispositivos = subprocess.call("lsblk --output LABEL | awk 'NF' | wc -l",shell=True)

        numerodispositivos = s.("lsblk --output LABEL | awk 'NF' | wc -l").run()

        #numerodispositivos = subprocess.Popen("lsblk --output LABEL | awk 'NF' | wc -l")
      
        print("numerodispositivos",numerodispositivos)
        while (numerodispositivos>0):
            print("numerodispositivos",numerodispositivos)
            comando="lsblk --output LABEL | awk 'NF' | sed -n {}p".format(numerodispositivos)
                    
                
            iii=0
            device_name = subprocess.Popen(comando, shell=True, stdout=subprocess.PIPE).stdout.read()
                    
                
            dispositivo.insert(iii, device_name)
            numerodispositivos-=1
            iii+=1
    

        listadispositivos = ttk.Combobox (container3,values=dispositivo)
        listadispositivos.pack ()                            

        #Radio Buttons
        rb1 = 0
        rb2 = 0
        rb3 = 0

       # def radiobutton():

        # radiobutton1= Checkbutton(container2,text="Excluir(arquivos exitentes)",variable=rb1)
        # radiobutton1.pack ()

        # radiobutton2= Checkbutton(container2,text="Recursivo",variable=rb1)
        # radiobutton2.pack ()

        # radiobutton3= Checkbutton(container2,text="Atualizar(arquivos exitentes)",variable=rb1)
        # radiobutton3.pack ()

        #Buttons

        def callback():
            return_code = subprocess.Popen("ifconfig", shell=True, stdout=subprocess.PIPE).stdout.read()
            

            print(return_code)

        buttonsalvar = Button(text="Salvar",command=callback)
        buttonsalvar.pack ()

        


window_height = 300
window_width = 350

screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()

x_cordinate = int((screen_width/2) - (window_width/2))
y_cordinate = int((screen_height/2) - (window_height/2))

root.geometry("{}x{}+{}+{}".format(window_width, window_height, x_cordinate, y_cordinate))

Application(root)
root.mainloop()