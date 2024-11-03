//
//  ContentView.swift
//  SaveData
//
//  Created by Long Vu on 3/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var newName = ""
    @State private var newDate: Date = .now
    
    var body: some View {
        NavigationStack{
            List(friends) {
                friend in
                HStack{
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(
                        selection: $newDate,
                        in: Date.distantPast...Date.now,
                        displayedComponents: .date
                    ){
                        TextField("name", text: $newName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self , inMemory: true)
}
