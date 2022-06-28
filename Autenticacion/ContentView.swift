//
//  ContentView.swift
//  Autenticacion
//
//  Created by Jennifer Becerril on 20/06/22.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var aut = false
    var body: some View {
        VStack{
            Text(aut ? "Estás autenticado" : "Se requiere autenticación").font(.title).bold()
            
            Button(aut ? "Cerrar" : "Autenticar"){
                if aut{
                    aut = false
                }
                else{
               autenticacion()
                }
            }
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(6)
            .font(.title2)
            .padding()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(aut ? Color.green : Color.red)
    }
    func autenticacion(){
        var error : NSError?
        
      
        let laContext = LAContext()
        if
            laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Autenticate utilizando un sensor biométrico"){
                autenticated, error in
                
                if autenticated{
                    aut = true
                }
                else{
                    aut = true
                }
            }
            
        }else{
            aut = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
