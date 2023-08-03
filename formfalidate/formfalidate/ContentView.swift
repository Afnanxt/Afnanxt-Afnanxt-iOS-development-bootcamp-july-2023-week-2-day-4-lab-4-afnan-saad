//
//  ContentView.swift
//  formfalidate
//
//  Created by afnan saad on 15/01/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @State var userName:String = ""
    @State var password:String = ""
    @State var email:String = ""
    @State var alert:Bool = false
    @State var showMassege:String = ""


    var body: some View {
      
            
            Form {
                        TextField("Username", text: $userName) { isChanged in
                            if !isChanged {
                                validateUsername(userName)
                                
                            }

                        }
                        .font(.title2)

                        
                        SecureField("Password", text: $password)
                    .font(.title2)

                        TextField("Email", text: $email) { isChanged in
                            if !isChanged {
                                validateEmail(email)
                            }
                        }
                        .font(.title2)

                        
                      .frame(height: 50)
                        Button {
                            validateUsername(userName)
                            validatePassword(password)
                            validateEmail(email)
                        } label: {
                            Text(" sign up")
                                .font(.largeTitle)
                                .padding(.all)
                                .cornerRadius(125)
                        }
                        
                        
                    }
                    .alert(isPresented: $alert) {
                        Alert (title: Text(showMassege))
                    }
                }
                
                func isValidEmail(_ email: String) -> Bool {
                    let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
                    return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
                }
                
                func validateUsername(_ value: String) {
                    if value.isEmpty {
                        alert = true
                        showMassege = "Username empty!"
                    } else {
                        if value.count < 8 {
                            alert = true
                            showMassege = "Username should be more than 10 characters"
                        }
                    }
                }

                func validateEmail(_ value: String) {
                    if value.isEmpty {
                        alert = true
                        showMassege = "Email is empty !"
                    } else if(!isValidEmail(email)) {
                       alert = true
                        showMassege = "Email valid "
                    }
                }

                func validatePassword(_ value: String) {
                    if value.isEmpty {
                       alert = true
                        showMassege = "Password empty!"
                    } else {
                        if value.count < 10 {
                            alert = true
                            showMassege = "Password should be more than 10 characters"
                        }
                    }
                }
                
                
            }
                
                
            
            
            
            
            
        
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
