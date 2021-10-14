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
        @State var OpacityPerso:Double=0
        @State var PositionYBoss:Double=200

        @State var isAlive=true
    
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
                    .position(x: positionXCanguro+2*passo, y: positionYCanguro-150)
                    .opacity(OpacityKangooJ)
                    .onChange(of: OpacityKangooJ){
                        newValue in OpacityKangooJ
                        positionXCanguro+=passo
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(600)){
                                OpacityKangooJ=0
                                OpacityKangooS=1
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
                    .position(x: 450, y: PositionYBoss)
                    .onAppear {
//                        var secondo:Double=1
                        for i in 0...100{
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(i)){
//                                positionXBackground+=10
                                PositionYBoss = PositionYBoss == 200 ? 180 : 200
                                //positionXCanguro+=10
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
                          
                           if(OpacityKangooS==1 && OpacityKangooJ==0){
                               OpacityKangooS=0
                               OpacityKangooW=1
                           }
                           else if(OpacityKangooJ==0){
                               OpacityKangooS=1
                               OpacityKangooW=0
                           }
                           if(OpacityKangooJ==0){
                               positionXBackground-=passo
                           }
                           if(positionXBackground<200)
                           {
                               positionXBackground+=100
                           }
                           
                        
                           
                       }
                       .buttonStyle(.borderedProminent)
                       Button("Jump"){
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

struct SchermataVittoria:View{
    @State var OpacityVinto:Double=1
    var body: some View{
        ZStack{
            Text("")
                .frame(width: 768, height:1024,
                       alignment: .center)
                .background(.gray)
                .opacity(OpacityVinto)
                Button("Vinto"){
//                Vittoria()
                }
                .buttonStyle(.borderedProminent)
                .position(x: 400, y: 400)
        }
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

