import SwiftUI

struct MenuItemView: View {
    var item: MenuItem
    
    var body: some View {
        HStack(spacing:16){
            
            Image(systemName:item.imageName)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.blue)
            
            VStack(alignment:.leading, spacing:5){
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            VStack(alignment:.trailing, spacing:5){
                Text(String(format:"$%.2f", item.price))
                    .fontWeight(.semibold)
                    .foregroundColor(item.price < 7 ? .green : .primary)
                if item.price > 10 {
                    HStack(spacing:4){
                        Image(systemName: "star.fill")
                        Text("Premium")
                        
                    }
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.orange)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.orange.opacity(0.2))
                    .clipShape(Capsule())
                }
            }
            .frame(width:80, alignment:.trailing)
            
        }
    }
}
