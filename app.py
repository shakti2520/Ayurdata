from flask import Flask, jsonify, render_template, request
import mysql.connector
from mysql.connector import Error
from flask import Flask, render_template,session, redirect, url_for

app = Flask(__name__)
app.secret_key = 'any random string'
conn = mysql.connector.connect(host="localhost",
                           user="root",
                           password="java",
                           db = "ayurdata")

@app.route("/")
def index():
    return redirect(url_for('login'))

@app.route("/login", methods=['GET','POST'])
def login():
    if 'username' in session:
        return redirect(url_for('dashboard'))
    if request.method == 'POST':
        det = request.form
        user = det['user']
        pswd = det['pass']
        print("***************************", user , "   " , pswd , "*************************** " )
        c = conn.cursor()
        query = "SELECT password,user_type from logins where uname='"+user+"'"
        c.execute(query)
        
        data = c.fetchall()
        print("***************************", data , "**********************")
        if pswd == data[0][0]:
            session['username'] = user
            session['user_type'] = data[0][1]
            print( data[0][1])            
            return redirect(url_for('dashboard'))
    return render_template("login.html")

@app.route('/dashboard')
def dashboard():
    if 'username' in session:
        if session['user_type']=='f':
            c = conn.cursor()
            query = "SELECT * from requested_plants"
            c.execute(query)
            r_plants = c.fetchall()
            r_plants = list(r_plants)
            for i in range(len(r_plants)):
                r_plants[i]=list(r_plants[i])
            
            query = "select ordered_plants.Order_id,\
            plant_detail.Name,\
            ordered_plants.Date,\
            ordered_plants.Quantity,\
            plant_detail.Image\
            from ordered_plants\
            left join plant_detail on ordered_plants.Plant_id = plant_detail.Plant_id"
            c.execute(query)
            o_plants = c.fetchall()
            o_plants = list(o_plants)
            for i in range(len(o_plants)):
                o_plants[i]=list(o_plants[i])
            print("*********************************************  ", o_plants, "******************************************")
            return render_template('dashboard.html',r_plants = r_plants, o_plants = o_plants)
            
        if session['user_type']=='c':
            c = conn.cursor()
            query = "SELECT * from plant_detail"
            c.execute(query)
            plants = c.fetchall()
            plants = list(plants)
            for i in range(len(plants)):
                plants[i]=list(plants[i])
            print(plants)
            return render_template('dashboard.html',plants = plants)
    else:
        return redirect(url_for('login'))

@app.route('/logout')
def logout():
    if 'username' in session:
        session.pop('username',None)
    return redirect(url_for('login'))

@app.route('/Place_order',methods=['GET', 'POST'])
def place_order():
    print('********************************')
    if request.method == "POST":
        """
        c = conn.cursor()
        details = request.form
        
        c.execute("INSERT INTO MyUsers(firstName, lastName) VALUES (%s, %s)", (firstName, lastName))
        conn.close()"""
        details = request.form
        for i in range(0,int(len(details)/2)):
            plant = "plant"+str(i+1)
            weight = "weight"+str(i+1)
            print(details[plant], "  " , details[weight], " \n")
    return render_template('Place_order.html')

@app.route('/feedback', methods=['GET', 'POST'])
def feedback():
    print('********************************')
    if request.method == 'POST':
        print("post")
        det = request.form
        print(det)
        print(det['orderid'], "  " , det['rating'], "   " , det['message'])
        return 'success'

@app.route('/company_reg', methods=['GET', 'POST'])
def company_reg():
    print('********************************')
    if request.method == 'POST':
        det = request.form
        print(det)
        c = conn.cursor()      
        if det['user'] == "c":
            name=det['name']
            contact = int(det['contact'])
            email =det['email']
            street =det['street']
            city =det['city']
            state = det['state']
            country = det['country']
            pin = int(det['pin'])
            regno=det['regno']
            q="INSERT INTO companyreg(Company_Name, Contact_no, Email_id, Street, City, State, Country,PIN_no, Companyreg_no) VALUES ( '"+name+"',"+ str(contact) +",'"+email+"','"+ street +"','"+city+"','"+ state+"','"+ country+"',"+ str(pin)+",'"+ regno+"')" 
            c.execute(q)
            c.execute("INSERT INTO logins(uname, password, user_type) VALUES ('"+det['email']+"','"+ det['password']+"','"+ det['user']+"')")
            conn.commit()
            conn.close()
            """print("INSERT INTO logins(uname, password, user_type) VALUES 
            ('"+det['email']+"','"+ det['password']+"','"+ det['user']+"')")
            print(q)"""
        if det['user'] == "f":
            fid=det['fid']
            name=det['name']
            contact = int(det['contact'])
            dob =det['dob']
            street =det['street']
            city =det['city']
            state = det['state']
            country = det['country']
            pin = int(det['pin'])
            q="INSERT INTO farmerreg(Farmer_id,Name, Contact_no, DOB, Street, City, State, Country,PIN ) VALUES ( '"+fid+"','"+name+"',"+ str(contact) +",'"+dob+"','"+ street +"','"+city+"','"+ state+"','"+ country+"',"+ str(pin)+")" 
            c.execute(q)
            c.execute("INSERT INTO logins(uname, password, user_type) VALUES ('"+det['fid']+"','"+ det['password']+"','"+ det['user']+"')")
            conn.commit()
            conn.close()
            print(q)
    return render_template('company_reg.html')



if __name__ == '__main__':
    app.run(debug = True, use_reloader = False)