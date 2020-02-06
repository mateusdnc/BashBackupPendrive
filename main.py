from tkinter import *

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

        container2 = Frame(master,height = 200,borderwidth=2, relief="groove")
       # container2.place(relx=0.5, rely=0.5, anchor=CENTER)
        container2.pack (fill=X,padx=5)

        #Containers Seção 3

        container5 = Frame(master)
        container5.pack (pady=10)

        #Texts
        text1 = Label(container1_child1, text="Diretorios",)
        text1.pack ()

        text2 = Label(container1_child1, text="Caminho do backup local",)
        text2.pack (side=LEFT)

        text3 = Label(container1_child2, text="Caminho pendrive",)
        text3.pack (side=LEFT)

        ####

        text3 = Label(container2, text="Opções")
        text3.pack ()



        #Entrys
        localbackup = Entry(container1_child1)
        localbackup.pack (side=RIGHT)

        localpendrive = Entry(container1_child2)
        localpendrive.pack (side=RIGHT)

        #Radio Buttons
        rb1 = 0
        rb2 = 0
        rb3 = 0

        radiobutton1= Radiobutton(container2,text="Excluir(arquivos exitentes)",variable=rb1, value=1)
        radiobutton1.pack ()

        radiobutton2= Radiobutton(container2,text="Recursivo",variable=rb2, value=1)
        radiobutton2.pack ()

        radiobutton3= Radiobutton(container2,text="Atualizar(arquivos exitentes)",variable=rb3, value=1)
        radiobutton3.pack ()

        #Buttons

        buttonsalvar = Button(text="Salvar")
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