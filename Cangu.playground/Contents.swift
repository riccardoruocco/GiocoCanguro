import SwiftUI
import PlaygroundSupport


struct Scena: View{
    
        @State  var positionXCanguro: CGFloat = 250
        @State  var positionYCanguro: CGFloat = 450
        @State  var positionXBackground: CGFloat = 400
        @State var positionYBackground: CGFloat=200
        @State var positionXNemico: CGFloat=1000
        @State var positionYNemico: CGFloat = 450
        @State  var OpacityKangooS:Double=1
        @State  var OpacityKangooW:Double=0
        @State  var OpacityKangooJ:Double=0
        @State  var OpacityKangooP1:Double=0
        @State  var OpacityKangooP2:Double=0
        @State  var OpacitySoldato:Double=1
        @State var OpacityPerso:Double=0
        @State var NumeroNemici=3
        @State var isAlive=true
    
        let passo:CGFloat=70
    
    
    var body: some View{
        ZStack{
               Image(uiImage: UIImage(named: "sunset")!)
                   .resizable()
                   .scaledToFill()
                   .frame(width: 768, height: 1024, alignment: .center)
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
            
                    Image(uiImage: UIImage(named: "soldato")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXNemico, y: positionYCanguro)
                    .opacity(OpacitySoldato)
                    .onAppear {
//                        var secondo:Double=1
                        for i in 0...100{
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(i)){
//                                positionXBackground+=10
                                positionXNemico-=passo
                                //positionXCanguro+=10
                            }
                        }
                    }
                    .onChange(of: positionXNemico){
                        print("A")
                        newValue in positionXNemico
                        if(positionXNemico<0 && NumeroNemici>0){
                            NumeroNemici-=1
                            positionXCanguro-=200
                            positionXNemico=1000+positionXBackground
                        }
                        if(((abs(positionXNemico-positionXCanguro))<20)&&((abs(positionYNemico-positionYCanguro))<10))
                        {
                     
                            Sconfitta()
                        }
                        if(NumeroNemici==0){
                            Vittoria()
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
                               positionXNemico-=passo
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
                   
                   Spacer()
                   Spacer()
                   Spacer()
                   
               }
               
                  
                   
            }
               
                    }
}
struct SchermataSconfitta:View{
    @State var OpacityPerso:Double=1
    var body: some View{
        ZStack{
            Text("")
                .frame(width: 768, height:1024,
                       alignment: .center)
                .background(.gray)
                .opacity(OpacityPerso)
                Button("Rigioca"){
                Rigioca()
                }
                .buttonStyle(.borderedProminent)
                .position(x: 400, y: 400)
        }
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


