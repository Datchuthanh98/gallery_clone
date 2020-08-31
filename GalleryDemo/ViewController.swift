
import UIKit

struct Item {
  var imageName: String
    var descript :String
}

class ViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
    var items: [Item] =
    [Item(imageName: "1",descript: "the description of image"),
    Item(imageName: "2",descript: "the description of image"),
    Item(imageName: "3",descript: "the description of image"),
    Item(imageName: "4",descript: "the description of image"),
    Item(imageName: "5",descript: "the description of image")
    ]
    
  let cellIdentifier = "ItemCollectionViewCell"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    setupCollectionView()
    setupCollectionViewItemSize()
  }
  

  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    let nib = UINib(nibName: cellIdentifier, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
  }
  
  private func setupCollectionViewItemSize() {
    let customLayout = CustomLayout()
    customLayout.delegate = self
    collectionView.collectionViewLayout = customLayout
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource , CustomLayoutDelegate{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
    cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
    cell.txtDescription.text = items[indexPath.item].descript
    return cell
  }

    
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
      return UIImage(named: items[indexPath.item].imageName)!.size
    }
}


