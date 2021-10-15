//: [Previous](@previous)

import Foundation
import AVFoundation
import SwiftUI
import PlaygroundSupport

//SOUNDTRACK
var audioPlayer: AVAudioPlayer!

//Play soundtrack
func playSound(_ fileName : String) {
    guard let soundURL = Bundle.main.url(forResource: fileName, withExtension: nil ) else {
        fatalError("Unable to find \(fileName) in bundle")
    }
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        audioPlayer.numberOfLoops = -1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    } catch {
        print(error.localizedDescription)
    }
}   
let INITIAL_Y_BOSS: Double = 200
let INITIAL_X_BOSS: Double = 450

struct Scena: View{
    
    
        @State  var positionXCanguro: CGFloat = 100
        @State  var positionYCanguro: CGFloat = 475
        @State  var positionXBackground: CGFloat = 400
        @State var positionYBackground: CGFloat=374
        @State  var OpacityKangooS:Double=1
        @State  var OpacityKangooW:Double=0
        @State  var OpacityKangooJ:Double=0
        @State  var OpacityKangooP1:Double=0
        @State  var OpacityKangooP2:Double=0
        @State  var OpacityTazzina:Double=0
        @State var OpacityPerso: Double=0
        @State var PositionYBoss: Double = INITIAL_Y_BOSS
        @State var PositionXBoss: Double = INITIAL_X_BOSS
        @State var PositionXTazzina: Double = INITIAL_X_BOSS;
        @State var PositionYTazzina: Double = INITIAL_Y_BOSS;
        @State var frameChange = false
        @State var isAlive = true
        @State var isTazzinaGoing = false
        @State var numTazzine = Int.random(in: 2...3)
        @State var ReginaOnTheFloor = false
        @State var ReginaHealth = 2
    
        let passo:CGFloat=70
    
    
  
    var body: some View{
        
        ZStack{
               Image(uiImage: UIImage(named: "sunset2")!)
                   .resizable()
                   .scaledToFill()
                   .frame(width: 561, height: 748, alignment: .center)
                   .position(x: positionXBackground, y: positionYBackground)
                   
                
                   Image(uiImage: UIImage(named: "KangooS")!)
                       .resizable()
                       .scaledToFill()
                       .frame(width: 50, height: 100, alignment: .center)
                       .position(x: positionXCanguro, y:positionYCanguro)
                       .opacity(OpacityKangooS)
            
                    Image(uiImage: UIImage(named: "kangooWalk")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro)
                    .opacity(OpacityKangooW)
            
                    Image(uiImage: UIImage(named: "kangooJ")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro-150)
                    .opacity(OpacityKangooJ)
                    .onChange(of: OpacityKangooJ){
                        newValue in OpacityKangooJ
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(600)){
                                OpacityKangooJ=0
                                OpacityKangooS=1
                                positionYCanguro = 475
                        }
                    }
            
                    Image(uiImage: UIImage(named: "tazzina")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    .position(x: PositionXTazzina, y: PositionYTazzina)
                    .opacity(OpacityTazzina)
                    .onChange(of: frameChange){
                        newValue in
                        if (isTazzinaGoing) {
                            OpacityTazzina = 1
                            PositionXTazzina -= 85
                            PositionYTazzina += 80
                        
                            // 110.0 100.0 520.0 325.0
                            if (PositionXTazzina == 110.0 &&  PositionYTazzina == 520.0 && positionYCanguro == 475.0) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                    Sconfitta()
                                }
                            }
                            if (PositionXTazzina < 0 && PositionYTazzina > 650) {
                                isTazzinaGoing = false
                                numTazzine -= 1
                                if (numTazzine < 0) {
                                    print("Regina on the floor")
                                    ReginaOnTheFloor = true
                                    PositionYBoss = 400
                                }
                            }
                        }
                    }
                   
            
                    Image(uiImage: UIImage(named: "kangooP1")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro)
                    .opacity(OpacityKangooP1)
                    .onChange(of: OpacityKangooP1){
                        newValue in OpacityKangooP1
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(1500)){
                                OpacityKangooP1=0
                                OpacityKangooS=1
                        }
                    }
                    
                    Image(uiImage: UIImage(named: "kangooP2")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro)
                    .opacity(OpacityKangooP2)
            
                    Image(uiImage: UIImage(named: "boss")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .position(x: PositionXBoss, y: PositionYBoss)
                    .onAppear {
//                        var secondo:Double=1
                        for i in 0...10000{
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(i)){
//                                positionXBackground+=10
                                frameChange = !frameChange
                                if (!ReginaOnTheFloor) {
                               
                                    PositionYBoss = PositionYBoss == INITIAL_Y_BOSS ? INITIAL_Y_BOSS - 20 : INITIAL_Y_BOSS
                                }
                                //positionXCanguro+=10
                            }
                        }
                        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) {_ in
                            if (!isTazzinaGoing && !ReginaOnTheFloor) {
                                PositionXTazzina = INITIAL_X_BOSS;
                                PositionYTazzina = INITIAL_Y_BOSS;
                                isTazzinaGoing = true
                            }
                        }

                    }
                    
                  
                    
           
               VStack(alignment:.trailing){
                   Spacer()
                   Spacer()
                   Spacer()
                   Spacer()
                   HStack(spacing:20){
                       Button("Walk"){
                           
                           if (ReginaOnTheFloor && positionXCanguro + 130 <= PositionXBoss) {
                               positionXCanguro += passo
                           }
                           
                           if (!ReginaOnTheFloor) {
                               if(OpacityKangooJ==0){
                                   positionXBackground-=passo
                               }
                               if(positionXBackground<200)
                               {
                                   positionXBackground+=100
                               }
                               if(OpacityKangooS==1 && OpacityKangooJ==0){
                                   OpacityKangooS=0
                                   OpacityKangooW=1
                               }
                               else if(OpacityKangooJ==0){
                                   OpacityKangooS=1
                                   OpacityKangooW=0
                               }
                               
                           }
  
                       }
                       .buttonStyle(.borderedProminent)
                       Button("Jump"){
                           positionYCanguro -= 100
                           if(OpacityKangooS==1 || OpacityKangooW==1 || OpacityKangooP1==1){
                               OpacityKangooS=0
                               OpacityKangooW=0
                               OpacityKangooJ=1
                               OpacityKangooP1=0

                           }
                           else{
                               OpacityKangooS=1
                               OpacityKangooJ=0
                           }
                       }
                       .buttonStyle(.borderedProminent)
                       Button("Punch"){
                           if(OpacityKangooS==1)
                           {
                               OpacityKangooS=0
                               OpacityKangooP1=1
                               
                           }
                           else if(OpacityKangooP1==1){
                               OpacityKangooP1=0
                               OpacityKangooS=1
                           }
                           if (!(ReginaOnTheFloor && positionXCanguro + 130 <= PositionXBoss)) {
                               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                   ReginaHealth -= 1
                                   if (ReginaHealth == 0) {
                                       Vittoria()
                                   } else {
                                       ReginaOnTheFloor = false
                                       positionXCanguro = 100
                                       PositionYBoss = INITIAL_Y_BOSS
                                       numTazzine = Int.random(in: 2...3)
                                   }
                                   
                               }
                               
                           }
                         
                       }
                       .buttonStyle(.borderedProminent)

                   }
                   .offset(y: 200)
                   
                   Spacer()
                   Spacer()
                   Spacer()
                   
               }
            Button(action: {
                if (audioPlayer?.volume == 1) {
                    audioPlayer?.volume = 0
                } else {
                    audioPlayer?.volume = 1
                }
            })/*PauseSoundtrack*/{
                VStack(spacing: 5) {
                    Image(systemName: "playpause.fill")
                    Text("Sound")
                        .font(.system(size: 10, weight: .bold))
                }
                .padding(.top, 10)
            }
                .frame(width: 60, height: 75, alignment: .top)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(7.5)
                .offset(y: 355)
                .opacity(0.5)
               
                  
                   
            }
        .onAppear(perform: {
            playSound("gameplay.mp3")
        })
    }
}
//HAI PERSO
struct SchermataSconfitta:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    @State var OpacityPerso:Double=1
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Objects
            Image(uiImage: UIImage(named: "lose")!)
                .resizable()
                .scaledToFill()
                .frame(width: 550, height: 100, alignment: .center)
                .offset(y:85)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1.5)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            
            //Text
            Image(uiImage: UIImage(named: "text-lose")!)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 100, alignment: .center)
                .offset(y: -235)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1.5)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            Button("PLAY AGAIN"){
                Rigioca()
            }
            .frame(width: 250, height: 75, alignment: .center)
            .foregroundColor(.white)
            .background(.black)
            .font(.system(size: 30, weight: .bold))
            .cornerRadius(7.5)
            .padding(35)
            .offset(y: 220)
            
            Button(action: {
                if (audioPlayer?.volume == 1) {
                    audioPlayer?.volume = 0
                } else {
                    audioPlayer?.volume = 1
                }
            })/*PauseSoundtrack*/{
                VStack(spacing: 5) {
                    Image(systemName: "playpause.fill")
                    Text("Sound")
                        .font(.system(size: 10, weight: .bold))
                }
                .padding(.top, 10)
            }
                .frame(width: 60, height: 75, alignment: .top)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(7.5)
                .offset(y: 355)
                .opacity(0.5)
        }
        .onAppear(perform: {
            playSound("intro.mp3")
        })
    }
}

//HAI VINTO
struct SchermataVittoria:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    @State var OpacityVinto:Double=1
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Objects
            Image(uiImage: UIImage(named: "win")!)
                .resizable()
                .scaledToFill()
                .frame(width: 550, height: 100, alignment: .center)
                .offset(y:85)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1.5)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            
            //Text
            Image(uiImage: UIImage(named: "text-win")!)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 100, alignment: .center)
                .offset(y: -235)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1.5)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            
            Button(action: {
                if (audioPlayer?.volume == 1) {
                    audioPlayer?.volume = 0
                } else {
                    audioPlayer?.volume = 1
                }
            })/*PauseSoundtrack*/{
                VStack(spacing: 5) {
                    Image(systemName: "playpause.fill")
                    Text("Sound")
                        .font(.system(size: 10, weight: .bold))
                }
                .padding(.top, 10)
            }
                .frame(width: 60, height: 75, alignment: .top)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(7.5)
                .offset(y: 355)
                .opacity(0.5)
        }
        .onAppear(perform: {
            playSound("sound.mp3")
        })
    }
}

var Inizio:Scena=Scena()
 
func Sconfitta(){
    PlaygroundPage.current.setLiveView(SchermataSconfitta())

}
func Rigioca(){
    PlaygroundPage.current.setLiveView(Scena())
}
func Vittoria(){
    PlaygroundPage.current.setLiveView(SchermataVittoria())
}


PlaygroundPage.current.setLiveView(Inizio)

//: [Next](@next)

