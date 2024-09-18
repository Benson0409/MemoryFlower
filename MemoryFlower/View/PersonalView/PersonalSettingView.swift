
import SwiftUI
import PhotosUI
import SwiftyCrop

struct PersonalSettingView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var data: Data?
    @State private var showImageCropper: Bool = false
    @State private var selectImage:UIImage?
    
    @State private var isLogin:Bool = false
    @Binding var isInput:Bool
    var body: some View {
        ZStack {
            Color
                .orange
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                Text("個人資料設定")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                
                // 顯示裁切後的圖片，如果存在的話
                if let croppedImage = selectImage {
                    Image(uiImage: croppedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    // 顯示原始圖片或佔位符
                    if let data = data, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    } else {
                        Color.gray
                            .clipShape(Circle())
                            .frame(width: 120, height: 120)
                    }
                }
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images
                ) {
                    Label("Select a photo", systemImage: "photo")
                }
                .onChange(of: selectedItem) {
                    guard let item = selectedItem else {
                        print("No item selected")
                        return
                    }
                    
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let successData):
                            if let successData = successData {
                                showImageCropper = true
                                self.data = successData
                            } else {
                                print("Data is nil")
                            }
                        case .failure(let error):
                            print("Error loading image: \(error)")
                        }
                    }
                }
                
                PersonTextFieldView()
                
                Button(action: {
                    isInput = true
                }, label: {
                    Text("確認")
                        .foregroundStyle(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.red)
                        .clipShape(.rect(cornerRadius: 15))
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .fullScreenCover(isPresented: $showImageCropper) {
                if let data = data, let uiImage = UIImage(data: data){
                    
                    SwiftyCropView(
                        imageToCrop: uiImage,
                        maskShape: .circle
                    ) { croppedImage in
                        // 當裁切完成時，存儲裁切後的圖片
                        self.selectImage = croppedImage
                        self.showImageCropper = false
                    }
                }
            }
            .fullScreenCover(isPresented: .constant(!isLogin)) {
                HomeView(isSuccess: $isLogin)
            }
        }
    }
}

#Preview {
    PersonalSettingView(isInput: .constant(false))
}
