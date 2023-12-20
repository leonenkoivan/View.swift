       .sheet(isPresented: $showLoadSheet) {
            DataImporterView(data: $data)
        }
        .onChange(of: data) { _ in
            loadCollage()
        }
    }
    
    private func saveCollage() {
        data = try? JSONEncoder().encode(store.state.collage)
        showSaveSheet.toggle()
    }
    
    private func loadCollage() {
        guard let data,
              let collage = try? JSONDecoder().decode(
                Collage.self,
                from: data
              ) else {
            return
        }
        
        store.dispatch(.setCollage(collage))
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
