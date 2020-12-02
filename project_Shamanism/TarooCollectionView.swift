import UIKit

//필요한 프로토콜 상속 받기
class TarooCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let images = ["taroo0", "taroo1", "taroo2", "taroo3", "taroo4", "taroo5", "taroo6", "taroo7", "taroo8", "taroo9", "taroo10", "taroo11", "taroo12", "taroo13", "taroo14", "taroo15", "taroo16", "taroo17", "taroo18", "taroo19", "taroo20", "taroo21"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //이미지 카운터 하는 함수
        
       return images.count
        
    
    }
    
    //셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.detailExplain = indexPath.row
        return cell
    }
    
    //http://m.cafe.daum.net/ok1221/9fQk/90724
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewCellWithd = collectionView.frame.width/2 - 1
        return CGSize(width: collectionViewCellWithd, height: collectionViewCellWithd * 1.6)
        
    }
    
    //위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    //옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? CustomCell else{
            print("sender 가 cell이 아님")
            return
        }
        
        guard let nextViewController = segue.destination as? DetailTarooViewController else{
            return
        }
        
        nextViewController.previousValue = cell.detailExplain
        
        
        
        
    }
    
}



//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    guard let cell = sender as? TableViewController else{
//        print("sender 가 cell이 아님")
//        return
//    }
//
//    guard let nextViewController = segue.destination as? DetailTarooViewController else{
//        return
//    }
//
//    nextViewController.previousLabel.text = cell.image.U
//
//}


//커스텀 셀 구현
class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    var detailExplain: Int?
    
    
}
