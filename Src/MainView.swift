import SwiftUI
// import PartyUI // เปิดใช้ถ้าติดตั้งผ่าน package เรียบร้อย

struct MainView: View {
    var onSelectVideo: () -> Void // ตัวส่งสัญญาณกลับไปฝั่ง Obj-C
    @State private var isShowingSettings = false // สถานะสำหรับเปิด/ปิดหน้าต่างตั้งค่า
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    // ส่วนแสดงสถานะการทำงานปัจจุบัน (Status Banner)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.blue)
                            Text("โหมดการทำงานปัจจุบัน")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.gray)
                        }
                        
                        Text("สโลว์โมชันคงที่ 2.0x (Slow-Motion)")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("ระบบจะทำการดึงไฟล์ดิบตรงจากคลังภาพ ไม่ผ่านการบีบอัดของเบราว์เซอร์ และเร่งขยายเฟรมเวลาขึ้น 2 เท่าด้วย FFmpeg")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .lineSpacing(4)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(white: 0.07))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(white: 0.15), lineWidth: 1)
                    )
                    
                    Spacer()
                    
                    // ปุ่มหลักในการเลือกวิดีโอ (ดึง UI สไตล์ PartyUI มาใช้)
                    Button {
                        onSelectVideo() // กดแล้วส่งสัญญาณไปสะกิดฝั่ง Obj-C ทันที
                    } label: {
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("เลือกวิดีโอจากคลังภาพ")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                Text("เริ่มกระบวนการแปลงไฟล์ทันที")
                                    .font(.system(size: 13))
                                    .foregroundColor(.white.opacity(0.6))
                            }
                            Spacer()
                            Image(systemName: "video.badge.plus.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 12)
                    }
                    .buttonStyle(TranslucentButtonStyle()) 
                    
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
            }
            .navigationTitle("TT-Tool")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingSettings = true // เปิดหน้าต่างตั้งค่า
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.blue)
                    }
                }
            }
            // เรียกเปิดใช้งานหน้าตั้งค่าที่แยกไว้อีกไฟล์ตรง ๆ
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
