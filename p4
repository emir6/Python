from Tkinter import *
import ttk
import tkFileDialog

class Myclass():
    def __init__(self, window): #our class
        self.var = IntVar()  # Holds an integer
        self.frame1 = Frame(window) #top frame
        self.frame1.pack(expand=True, fill=BOTH, side=TOP) #frame location
        self.frame2 = Frame(window) #bottom frame
        self.frame2.pack(expand=True, fill=BOTH) #frame location
        self.frame3 = Frame(self.frame1, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline
        self.frame3.pack(expand=True, fill=BOTH, side=TOP,) #frame location
        self.frame4 = Frame(self.frame1, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline
        self.frame4.pack(expand=True, fill=BOTH, side=BOTTOM) #frame location
        self.frame5 = Frame(self.frame2, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline
        self.frame5.pack(expand=True, fill=BOTH, side=LEFT) #frame location
        self.frame6 = Frame(self.frame2, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline
        self.frame6.pack(expand=True, fill=BOTH, side=LEFT) #frame location
        self.frame7 = Frame(self.frame2, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline
        self.frame7.pack(expand=True, fill=BOTH, side=LEFT) #frame location

        self.label1 = Label(self.frame3, text="CAFE RECOMMENDER", bg="lightgreen", fg="red", font="Calibri 20") #write title on the frame
        self.label1.pack(expand=True, anchor=CENTER, pady=20) #location of writing

        self.button1 = Button(self.frame4, text="Upload Cafe Data", bg="red", fg="white", command=self.openfile) #file import button
        self.button1.grid(row=0, column=0, sticky=W, padx=150, pady=15, ipadx=15, ipady=10) #button location
        self.button2 = Button(self.frame4, text="Upload Rating", bg="red", fg="white", command=self.upload_rating) #file import button
        self.button2.grid(row=0, column=1, sticky=E, padx=200, pady=15, ipadx=25, ipady=10) #button location
        self.button3 = Button(self.frame5, text="R\nA\nT\nI\nN\nG\n", bg="pink", fg="white", relief=SUNKEN, activebackground ="#FFD43B", activeforeground="white", command=self.rating) #page toggle button
        self.button3.grid(row=0, column=0, sticky=N, padx=10, pady=10, ipadx=10) #location
        self.button4 = Button(self.frame5, text="R\nE\nC\nO\nM\nM\nE\nN\nD\n", bg="red", fg="white", activebackground= "#FFD43B", activeforeground="white", command=self.recommendation) #page toggle button
        self.button4.grid(row=1, column=0, sticky=S, padx=10, pady=80, ipadx=10) #location

        self.label2 = Label(self.frame6, text="Choose Cafe", fg="black", bg="lightgreen", font="Calibri 20") #creat label for write
        self.label2.grid(row=0, column=0, pady=20, padx=10) #location
        self.combobox1 = ttk.Combobox(self.frame6) # where the data is loaded
        self.combobox1.grid(row=1, column=0, padx=50, ipadx=70) #location
        self.label3 = Label(self.frame6, text="Choose Rating", bg="lightgreen", fg="black", font="Calibri 20") #creat label for write
        self.label3.grid(row=3, column=0, pady=30, padx=10) #location
        self.scale1 = Scale(self.frame6, from_=1, to=10, orient=HORIZONTAL, bg="lightgreen", highlightbackground="lightgreen", troughcolor="white") #where the choose rating
        self.scale1.grid(row=4, column=0, padx=10, ipadx=100) #location
        self.button5 = Button(self.frame6, text="ADD", bg="red", fg="white",command=self.add) #add to treview
        self.button5.grid(row=5, column=0, pady=5, ipadx=30, ipady=10) #location

        self.treeview1 = ttk.Treeview(self.frame7, columns="Cafe,Rating") #where writing cafes and ratings
        self.treeview1.heading('#0', text='Cafe') #place which in cafes
        self.treeview1.heading('#1', text='Rating') #palce which in ratings
        self.treeview1.grid(row=0, column=0, padx=10, pady=10) #location

        self.button6 = Button(self.frame7, text="REMOVE", bg="red", fg="white",command=self.remove) #delete button
        self.button6.grid(row=0, column=1, ipadx=10, ipady=20) #location

        self.frame8 = Frame(self.frame2, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline
        self.frame9 = Frame(self.frame2, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline
        self.frame10 = Frame(self.frame2, bg="lightgreen", borderwidth=2, relief=SOLID) #open frame in the frame and borderline

        self.label4 = Label(self.frame8, text="Settings", font="Calibri 20 underline", bg="lightgreen") #for write
        self.label5 = Label(self.frame8, text="Number of Recommendation", bg="lightgreen", font="Calibri 12 bold") #for write
        self.entry1 = Entry(self.frame8) #wants input from user
        self.button7 = Button(self.frame8, text="Recommend\nSimilar User", bg="red", fg="white", command=self.recommend_similar_user) #button
        self.label6 = Label(self.frame8, text="Similarity Metrics", font="Calibri 12 bold", bg="lightgreen") #for write
        self.button8 = Button(self.frame8, text="Recommend\nCafe", bg="red", fg="white", command=self.recommandcafe) #button
        self.checkbutton1 = Checkbutton(self.frame8, text="Euclidean", variable=self.var, bg="lightgreen", onvalue="1") #euclidean button
        self.checkbutton2 = Checkbutton(self.frame8, text="Pearson", variable=self.var, bg="lightgreen", onvalue="2") #pearson button
        self.checkbutton3 = Checkbutton(self.frame8, text="Jaccard", variable=self.var, bg="lightgreen", onvalue="3") #jaccard button

    def recommendation(self): #from rating to recomend page
        self.frame6.pack_forget() #forgetting at rating
        self.frame7.pack_forget() #forgetting at rating
        self.frame8.pack(expand=True, fill=BOTH, side=LEFT) #location
        self.frame9.pack(expand=True, fill=BOTH, side=LEFT)#location
        self.label4.grid(row=0, column=0, padx=60, pady=10)#location
        self.label5.grid(row=1, column=0)#location
        self.entry1.grid(row=2, column=0)#location
        self.button7.grid(row=3, column=1)#location
        self.label6.grid(row=4, column=0,)#location
        self.button8.grid(row=4, column=1, pady=10)#location
        self.checkbutton1.grid(row=5, column=0)#location
        self.checkbutton2.grid(row=6, column=0)#location
        self.checkbutton3.grid(row=7, column=0)#location
        self.button3 = Button(self.frame5, text="R\nA\nT\nI\nN\nG\n", bg="red", fg="white", activebackground="#FFD43B", activeforeground="white", command=self.rating) #changed the colour
        self.button3.grid(row=0, column=0, sticky=N, padx=10, pady=10, ipadx=10) #location
        self.button4 = Button(self.frame5, text="R\nE\nC\nO\nM\nM\nE\nN\nD\n", bg="pink", relief=SUNKEN, fg="white", activebackground="#FFD43B", activeforeground="white", command=self.recommendation) #changed the colour
        self.button4.grid(row=1, column=0, sticky=S, padx=10, pady=80, ipadx=10) #location

    def rating(self):
        self.frame8.pack_forget()#forgetting at rating
        self.frame9.pack_forget()#forgetting at rating
        self.frame10.pack_forget()#forgetting at rating
        self.frame6.pack(expand=True, fill=BOTH, side=LEFT)#location
        self.frame7.pack(expand=True, fill=BOTH, side=LEFT)#location
        self.button3 = Button(self.frame5, text="R\nA\nT\nI\nN\nG\n", bg="pink", fg="white", relief=SUNKEN, activebackground="#FFD43B", activeforeground="white", command=self.rating)#changed the colour
        self.button3.grid(row=0, column=0, sticky=N, padx=10, pady=10, ipadx=10)#location
        self.button4 = Button(self.frame5, text="R\nE\nC\nO\nM\nM\nE\nN\nD\n", bg="red", fg="white", activebackground="#FFD43B", activeforeground="white", command=self.recommendation)#changed the colour
        self.button4.grid(row=1, column=0, sticky=S, padx=10, pady=80, ipadx=10)#location

    def recommend_similar_user(self):
        self.frame10.pack_forget()#forgetting at rating
        self.frame9.pack(expand=True, fill=BOTH, side=LEFT)#location
        self.label7 = Label(self.frame9, text="Similar User", font="Calibri 15", bg="lightgreen")#for writing
        self.label7.grid(row=0, column=0, padx=150, pady=10)#location
        self.treeview2 = ttk.Treeview(self.frame9, columns="User,Similarity",height=5) #add the users similarity
        self.treeview2.heading('#0', text='User')#title
        self.treeview2.heading('#1', text='Similarity')#title
        self.treeview2.grid(row=1, column=0, padx=15)#location
        self.button9 = Button(self.frame9, text="Get User's Rating", bg="grey", fg="black") #button
        self.button9.grid(row=2, column=0, pady=5)#location
        self.label8 = Label(self.frame9, text="#'s Rating", font="Calibri 10", bg="lightgreen") #label for write
        self.label8.grid(row=3, column=0, pady=5)#location
        self.treeview3 = ttk.Treeview(self.frame9, columns="Cafe,Rating",height=5) #add the cafe and rating
        self.treeview3.heading('#0', text='Cafe') #title
        self.treeview3.heading('#1', text='Rating') #title
        self.treeview3.grid(row=4, column=0)#location


    def recommandcafe(self):
        self.frame9.pack_forget() #forgetting frame
        self.frame10.pack(expand=True, fill=BOTH, side=LEFT)#location
        self.label9 = Label(self.frame10, text="Similar Cafes", font="Calibri 15", bg="lightgreen") #for write
        self.label9.grid(row=0, column=0, padx=150, pady=10)#location
        self.treeview4 = ttk.Treeview(self.frame10, columns="Cafe,Similarity") #add cages and similarity
        self.treeview4.heading('#0', text='Cafe')#title
        self.treeview4.heading('#1', text='Similarity')#title
        self.treeview4.grid(row=1, column=0, padx=15)#location

    def openfile(self):
        self.filename = tkFileDialog.askopenfilename(initialdir="/", title="Select file", filetypes=(("all files", "*.*"), ("Excel files", "*.xlsx*")))#we have uploaded the file
        self.book = xlrd.open_workbook(self.filename)#add the file
        self.page = self.book.sheet_by_index(0)#add the file
        self.cafes = [] #list for cafes
        for k in range(1, self.page.nrows): #seperated by rows
            print self.page.cell_value(k, 0)#for see
            self.cafes.append(self.page.cell_value(k, 0))#for add
        self.combobox1["value"] = self.cafes #add cafes
        self.combobox1.current(0)

    def add(self):
        cafe = self.combobox1.get() #took value
        raiting = self.scale1.get() #took value
        self.treeview1.insert("", "end", text=cafe, values=str(raiting)) #adding

    def remove(self):
        self.treeview1.delete(*self.treeview1.get_children()) #for delete cafes and ratings


    def upload_rating(self):
        self.filename = tkFileDialog.askopenfilename(initialdir="/", title="Select file", filetypes=(("all files", "*.*"), ("Text files", "*.txt*"))) #for upload ratings
        self.rating = open(self.filename, "r") #for reading
        self.rating = {} #dict for ratings

    def recommendationss(self):
        recommendations.getRecommendations(self.rating)




def main():

    root = Tk()
    app = Myclass(root)
    root.title("Cafe Recommender 1.0") #title
    root.configure(bg="lightgreen")
    root.geometry("1000x550")
    root.mainloop()


main()
