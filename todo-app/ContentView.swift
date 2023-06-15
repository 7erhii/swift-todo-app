import SwiftUI

struct ContentView: View {
    @State private var isPopupVisible = false
    @State private var todoItem = ""
    @State private var todoList: [String] = []
    
    var body: some View {
        VStack {
            Text("Hello! This is your Todo")
                .font(.system(size: 30, weight: .bold, design: .default))
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(red: 40/255, green: 40/255, blue: 40/255))
            
            Spacer()
            
            ForEach(todoList, id: \.self) { item in
                HStack {
                    Text(item)
                        .padding(.leading)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        deleteTodoItem(item)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding(.trailing)
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                isPopupVisible = true
            }) {
                Text("ADD+")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .background(Color(red: 40/255, green: 40/255, blue: 40/255))
        .sheet(isPresented: $isPopupVisible) {
            ZStack {
                Color(red: 70/255, green: 70/255, blue: 70/255).edgesIgnoringSafeArea(.all)
                
                VStack {
                    TextField("Enter todo item", text: $todoItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color(red: 70/255, green: 70/255, blue: 70/255)) 
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    
                    Button(action: {
                        addTodoItem()
                        isPopupVisible = false
                    }) {
                        Text("Add")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 30)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
                }
            }
        }
    }
    
    private func addTodoItem() {
        if !todoItem.isEmpty {
            todoList.append(todoItem)
            todoItem = ""
        }
    }
    
    private func deleteTodoItem(_ item: String) {
        todoList.removeAll { $0 == item }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
