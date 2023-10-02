//
//  ContentView.swift
//  Factory Pattern SwiftUI
//
//  Created by Batuhan Kucukyildiz on 2.10.2023.
//

import SwiftUI


enum PlayerType : String {
    case pointGuard , center
    var text : String {
        switch self {
        case.pointGuard : return "PointGuard"
        case.center : return "Center"
        }
    }
}

protocol Player {
    var playerType : PlayerType {get}
    func shoot()
}

struct PointGuard : Player {
    var playerType: PlayerType = .pointGuard
    
    func shoot() {
        print("PointGuard Shoot")
    }
}

struct Center : Player {
    var playerType: PlayerType = .center
    
    func shoot() {
        print("Center shoot")
    }
}

class PlayerFactory {
    
    func makePlayer(playerType : PlayerType) -> Player {
        switch playerType {
            
        case .pointGuard:
            return PointGuard()
        case .center:
            return Center()
        }
    }
}

struct ContentView: View {
    let factory = PlayerFactory()
    @State private var players : [Player] = []
    var body: some View {
        VStack{
            VStack{
                ScrollView{
                    ForEach(0..<players.count, id:\.self){index in
                        VStack{
                            Text("\(players[index].playerType.text)")
                        }
                    }
                }
            }
            Spacer()
            HStack{
                Button("Point Guard"){
                    let player = factory.makePlayer(playerType: .pointGuard)
                    players.append(player)
                }
                Button("Center "){
                    let player = factory.makePlayer(playerType: .center)
                    players.append(player)
                }
                Button("Clean "){
                    players.removeAll()
                }
            }.buttonStyle(.bordered)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
