from tkinter import *
class Application(Frame):
    def __init__(self, master=None):
        Frame.__init__(self, master)
       
        #Containers       
        container1 = Frame(master,borderwidth=2, relief="groove")
        container1.pack ()


        container2 = Frame(container1)
        container2.pack ()


        container3 = Frame(container1)
        container3.pack ()

        ####

        container4 = Frame(master,borderwidth=2, relief="groove")
        container4.pack ()

        ####

        container5 = Frame(master)
        container5.pack ()

        #Texts
        text1 = Label(container2, text="Diretorios",)
        text1.pack ()

        text2 = Label(container2, text="Caminho do backup local",)
        text2.pack (side=LEFT)

        text3 = Label(container3, text="Caminho pendrive",)
        text3.pack (side=LEFT)

        ####

        text3 = Label(container4, text="Opções")
        text3.pack ()



        #Entrys
        localbackup = Entry(container2)
        localbackup.pack (side=RIGHT)

        localpendrive = Entry(container3)
        localpendrive.pack (side=RIGHT)

        #Radio Buttons
        rb1 = 0
        rb2 = 0
        rb3 = 0

        radiobutton1= Radiobutton(container4,text="Excluir(arquivos exitentes)",variable=rb1, value=1)
        radiobutton1.pack ()

        radiobutton2= Radiobutton(container4,text="Recursivo",variable=rb2, value=1)
        radiobutton2.pack ()

        radiobutton3= Radiobutton(container4,text="Atualizar(arquivos exitentes)",variable=rb3, value=1)
        radiobutton3.pack ()

        #Buttons

        buttonsalvar = Button(text="Salvar")
        buttonsalvar.pack ()

root = Tk()

window_height = 300
window_width = 350

screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()

x_cordinate = int((screen_width/2) - (window_width/2))
y_cordinate = int((screen_height/2) - (window_height/2))

root.geometry("{}x{}+{}+{}".format(window_width, window_height, x_cordinate, y_cordinate))

Application(root)
root.mainloop()