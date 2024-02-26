//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Antonio Flores on 26/01/24.
//

import SwiftUI

// < iOS 17
class AppState: ObservableObject {
    @Published var isOn: Bool = false
}

struct ContentView: View {
    
    var body: some View {
        //HikeView()
        LightBulbMain()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(AppState())
        }
    }
}

// TODO: Refactor

struct SearchExampleView: View {
    @State private var searchText = ""
    @State private var friends: [String] = ["John", "Mary", "Steven", "Steve", "Jerry"]
    @State private var filteredFriends: [String] = []
    
    var body: some View {
        VStack {
            List(filteredFriends, id: \.self) { friend in
                Text(friend)
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText) { _ in
                if searchText.isEmpty {
                    filteredFriends = friends
                } else {
                    filteredFriends = friends.filter { $0.contains(searchText) }
                }
            }
            Spacer()
        }.padding()
        .onAppear(perform: {
            filteredFriends = friends
        })
        .navigationTitle("Friends")
    }
}

struct FriendsListView: View {
    @State private var name: String = ""
    @State private var friends: [String] = []
    
    var body: some View {
        VStack {
            TextField("Enter name", text: $name)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    friends.append(name)
                    name = ""
                }
            
            List(friends, id: \.self) { friend in
                Text(friend)
            }
            
            Spacer()
        }.padding()
    }
}

struct ToggleExample: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOn, label: {
                Text(isOn ? "ON" : "OFF")
                    .foregroundColor(.white)
            }).fixedSize()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isOn ? .red : .black)
    }
}

struct CounterView: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
            Button("Add 1") {
                count += 1
            }
        }
    }
}

struct DemoView: View {
    var body: some View {
        VStack(spacing: 2) {
            Image("mountain")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))

            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1682685796186-1bb4a5655653?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!) { image in
                image.resizable()
            } placeholder: {
                ProgressView("Downloading...")
            }


            Text("First Line")
                .foregroundStyle(.cyan)
                .font(.largeTitle)
            Text("Second Line")
                .foregroundStyle(.green)
            Text("Third Line")
            HStack {
                Text("Left")
                Text("Right")
                    .fontWeight(.heavy)
            }
        }.foregroundStyle(.orange)
            .padding()
    }
}
