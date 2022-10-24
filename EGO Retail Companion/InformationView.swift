import SwiftUI

struct InformationView: View {
    @EnvironmentObject var gameState:GameState;
    var body: some View {
        Header();
        VStack{
            Text("Customer Information:");
            if ((gameState.customerName!) != ""){
                Text(gameState.customerName!);
            }
            if ((gameState.customerEmail!) != ""){
                Text(gameState.customerEmail!);
            }
            if ((gameState.customerPhone!) != ""){
                Text(gameState.customerPhone!);
            }
            if ((gameState.customerAddress!) != ""){
                Text(gameState.customerAddress!);
            }
            
            
            
            HStack {
                if ((gameState.customerCity!) != ""){
                    Text(gameState.customerCity!);
                }
                if ((gameState.customerState!) != ""){
                    Text(gameState.customerState!);
                }
                if ((gameState.customerZipcode!) != ""){
                    Text(gameState.customerZipcode!);
                }
                
            }
            
            HStack {
                List {
                    Text("LB7654 NLB101515128X")
                    Text("ST1501 NST101591527X")
                    Text("BA2800 NBA105151132X")
                }
            }
        }
        CustomDivider(color: Color.init(red: 122/255, green: 193/255, blue: 66/255), height: 5);
        
        HStack {
            
            
            Button(action: {
                //ACTIONS
            }) {
                HStack {
                    Image(systemName: "printer")
                        
                    Text("Print")
                        .fontWeight(.semibold)
                        
                }.padding().foregroundColor(.white).background(Color.red).cornerRadius(40)
            }
            
            Button(action: {
                //ACTIONS
            }) {
                HStack {
                    Image(systemName: "opticaldiscdrive")
                        
                    Text("Save PDF")
                        .fontWeight(.semibold)
                    
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
            }.padding().foregroundColor(.white).background(Color.red).cornerRadius(40)
            
            Button(action: {
                gameState.viewState = 0;
            }) {
                HStack {
                    Image(systemName: "arrow.uturn.backward.square")
                        
                    Text("Back")
                        .fontWeight(.semibold)
                    
                }
                
            }.padding().foregroundColor(.white).background(Color.red).cornerRadius(40)
            
            
        }
        
        Spacer();
    }
}



