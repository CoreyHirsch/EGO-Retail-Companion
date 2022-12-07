//
//  ContentView.swift
//  scanapp
//
//  Created by Corey Hirsch on 9/5/22.
//

import SwiftUI
import CodeScanner



struct CameraView: View {
    @EnvironmentObject var gameState:GameState;
    
    
    
//    var scannerSheet : some View {
//        CodeScannerView(
//            codeTypes: [.dataMatrix],
//            completion: { result in
//                if case let .success(code) = result {
//                    
//                    gameState.scannedCode = code.string;
//                    gameState.isPresentingScanner = false;
//                }
//            }
//        )
//    }
    
    
    var body: some View {
        VStack(spacing: 5){
            
            Text(gameState.scannedCode)
                
//                Button("Scan"){
//                    gameState.isPresentingScanner = true
//                }
//            
//                .sheet(isPresented: $gameState.isPresentingScanner){
//                    self.scannerSheet
//                }
            
               
        }
    }
}




