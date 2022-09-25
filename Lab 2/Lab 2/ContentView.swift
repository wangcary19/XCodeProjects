//ContentView.swift

//Cary Wang, for Professor Kounavelis's CISC 5410
//September 20th, 2022

import SwiftUI

struct ContentView: View {
    //Form variables
    @State private var companyName: String = ""
    @State private var addressStreet: String = ""
    @State private var addressCity: String = ""
    @State private var addressState: String = ""
    @State private var addressZIP: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var carrier: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    
    //Alert variables
    @State private var resultMessage: String = ""
    
    
    var body: some View {
        VStack {
            Group {
                Text("New Customer Registration Form")
                    .padding()
                
                TextField("Company Name", text: $companyName)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Street", text: $addressStreet)
                    .textFieldStyle(.roundedBorder)
                
                TextField("City", text: $addressCity)
                    .textFieldStyle(.roundedBorder)
                
                TextField("State Abbreviation", text: $addressState)
                    .textFieldStyle(.roundedBorder)
                
                TextField("ZIP", text: $addressZIP)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Phone #", text: $phone)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Carrier", text: $carrier)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
            }
            
            Group {
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Verify Password", text: $password2)
                    .textFieldStyle(.roundedBorder)
            }
            
            Group {
                Button(action : {
                    Task {
                        validateDataEntryForm()
                    }
                }, label: {
                    Text("SUBMIT")
                        .font(.title3)
                        .padding()
                })
                
                HStack {
                    Text("Status : ")
                    
                    Text(resultMessage)
                        .frame(width: 275, height: 70, alignment: .leading)
                        .background(Color.green)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
    
    //Function to raise alert when validation fails
    func presentAlert(withTitle title: String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        UIApplication.shared.keyWindow?.rootViewController?
            .present(alertController, animated: true, completion: nil)
    }
    
    func validateDataEntryForm() {
        let stateAbbreviations:[String] = ["AK", "AL", "AR", "AS", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MP", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UM", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"]
        let carriers:[String] = ["Verizon", "AT&T", "T-Mobile"]
        let companyName_t = companyName.trimmingCharacters(in:.whitespacesAndNewlines)
        let street_t = addressStreet.trimmingCharacters(in: .whitespacesAndNewlines)
        let city_t = addressCity.trimmingCharacters(in: .whitespacesAndNewlines)
        let zip_t = addressZIP.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone_t = phone.trimmingCharacters(in: .whitespacesAndNewlines)
        let carrier_t = carrier.trimmingCharacters(in: .whitespacesAndNewlines)
        let email_t = email.trimmingCharacters(in: .whitespacesAndNewlines)
        //let username_t = username.trimmingCharacters(in: .whitespacesAndNewlines)
        //let password_t = password.trimmingCharacters(in: .whitespacesAndNewlines)
        //let password2_t = password2.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Block 1: Address and name validation
        if (companyName_t.count < 5) {
            presentAlert(withTitle:"Invalid Data Form", message:"Company Name must be more than 5 characters!")
            return
        }
        if (street_t.count < 5) {
            presentAlert(withTitle:"Invalid Data Form", message:"Street address must be more than 5 characters!")
            return
        }
        if (city_t.count < 5) {
            presentAlert(withTitle:"Invalid Data Form", message:"City address must be more than 5 characters!")
            return
        }
        
        var isState:Bool = false
        for x in stateAbbreviations {
            if (x == addressState) {
                isState = true
                break
            }
        }
        if (!isState) {
            presentAlert(withTitle:"Invalid Data Form", message: "State code is not valid!")
            return
        }
        
        if (zip_t.count != 5 || !CharacterSet(charactersIn: zip_t).isSubset(of:CharacterSet.decimalDigits)){
            presentAlert(withTitle:"Invalid Data Form", message:"ZIP must be 5 numeric characters!")
            return
        }
            
        //Block 2: Contact info validation
        if (phone_t.count != 10 || !CharacterSet(charactersIn: phone_t).isSubset(of:CharacterSet.decimalDigits)){
            presentAlert(withTitle:"Invalid Data Form", message:"Phone # must be 10 numeric characters!")
            return
        }
        if (!carriers.contains(carrier_t)){
            presentAlert(withTitle:"Invalid Data Form", message:"Carrier must be Verizon, AT&T, or T-Mobile!")
            return
        }
            
        var hasat: Bool = false
        var hasdot: Bool = false
        for x in email_t {
            if (x == "@") {
                hasat = true
            }
            if (x == ".") {
                hasdot = true
            }
        }
        if (hasat == false || hasdot == false || email_t.count < 5 || !CharacterSet(charactersIn: phone_t).isSubset(of:CharacterSet.alphanumerics)){
            presentAlert(withTitle:"Invalid Data Form", message:"Email must be at least 5 characters and contain '@' and a valid web address")
            return
        }
            
        //Block 3: Username and password validation
        if (username.count < 10 || username.contains(" ")) {
            presentAlert(withTitle:"Invalid Data Form", message:"Username must be minimum 10 characters and alphanumeric only!")
            return
        }
            
            
        var secure:Bool = false
        for x in password {
            if (x.isUppercase) {
                secure = true
                break
            }
        }
        if (password.count < 10 || !secure) {
            presentAlert(withTitle:"Invalid Data Form", message:"Password must be minimum 10 characters and contain at least one uppercase character!")
            return
        }
        if (password != password2) {
            presentAlert(withTitle:"Invalid Data Form", message:"Passwords must match!")
            return
        }
            
        resultMessage = "Success!" + "\n" + "New Customer was Added!"
        }
    }

struct ContentView_Previews:PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
