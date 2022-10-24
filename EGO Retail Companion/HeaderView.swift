import SwiftUI

struct CustomDivider: View {
    var color:Color
    var height:CGFloat;
    init(color:Color, height:CGFloat){
        self.color = color;
        self.height = height;
    }
    var body: some View {
        Rectangle().fill(color).frame(height: height).edgesIgnoringSafeArea(.horizontal);
    }
}


struct Header: View {
    var body: some View {
        HStack {
            Image("Ego").resizable().frame(width: 242.5, height: 75).offset(x: -10, y: 15);
            ZStack {
                Image("Ace").resizable().frame(width: 150, height: 75);
            }.offset(x: -20, y: 7)
        }.frame(minWidth: 64, idealWidth: 64, maxWidth: .infinity, minHeight: 64, idealHeight: 90, maxHeight: 90, alignment: .topLeading).background(Color.init(red: 60/255, green: 57/255, blue: 54/255));
        CustomDivider(color: Color.init(red: 122/255, green: 193/255, blue: 66/255), height: 5);
    }
}
