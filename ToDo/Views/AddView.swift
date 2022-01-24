//
//  AddView.swift
//  ToDo
//
//  Created by Melbin Mathew on 22/01/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textInputText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("write...", text: $textInputText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button {
                    onSaveButtonPress()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding()
        }
        .navigationTitle("Add Task")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func onSaveButtonPress() {
        if validateInputText() {
            listViewModel.addItem(title: textInputText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func validateInputText() -> Bool {
        if textInputText.count < 3 {
            alertTitle = "Please add atleast 3 characters ☹️"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert()-> Alert {
        return Alert(title: Text(alertTitle))
    }

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }.environmentObject(ListViewModel())
    }
}
