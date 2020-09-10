//
//  main.swift
//  AppConsole
//
//  Created by Maxime Britto on 02/05/2017.
//  Copyright © 2017 mbritto. All rights reserved.
//

import Foundation

launchGame()

func launchGame() {
    let bot = Player(nickname: "Nono le petit robot") //Bot()
    let moi = Player(nickname: "nickname")
    var dicesValue: Int = 0
    
    repeat {
        print("Entrez votre prénom : ")
        moi.nickname = Utilisateur.saisirTexte()    // readLine()
    } while moi.nickname.count == 0
    
    var counter = 0
    while bot.health > 0 && moi.health > 0 {
        
        counter += 1    // Compteur de tour
        
        // Joueur 1 joue
        print("\(moi.nickname), appuyez sur 'Entrée' pour lancer les dés")
        _ = Utilisateur.saisirTexte()   // readLine()
        dicesValue = launchDices(player: moi)
        damageHealth(player: bot, dicesValue: dicesValue)
        displayInfos(player1: moi, player2: bot, dices: dicesValue)
        
        // Joueur 2 joue
        print ("\nC'est à \(bot.nickname) de jouer")
        dicesValue = launchDices(player: bot)
        damageHealth(player: moi, dicesValue: dicesValue)
        displayInfos(player1: bot, player2: moi, dices: dicesValue)
        
        print("Fin du tour \(counter)")
        print()
    }
    // Affichage du Gagnant
    gagnant(moi: moi, bot: bot)
}

func rollDices(username:String) -> Int {
    let dicesValue:Int = Int.random(in: 1...6) + Int.random(in: 1...6) // deux dés
    print("\(username) a lancé les dés et a obtenu \(dicesValue)")
    return dicesValue
}

func displayInfos(player1: Player, player2: Player, dices: Int) {
    print("\(player1.nickname) assène un coup sur \(player2.nickname) avec une force de \(dices)")
    if player2.health < 0 { player2.health = 0 }
    print("Santé de \(player2.nickname) \(player2.health)%")
    
}

func damageHealth(player: Player, dicesValue: Int) {
    player.health = player.health - dicesValue
}

func launchDices(player: Player) -> Int {
    return rollDices(username: player.nickname)
}

func gagnant(moi: Player, bot: Player) {
    if moi.health > bot.health {
        print("\(moi.nickname) a gagné")
    }
    if moi.health < bot.health {
        print("\(bot.nickname) a gagné")
    }
    if moi.health == bot.health {
        print("match nul")
    }
}
