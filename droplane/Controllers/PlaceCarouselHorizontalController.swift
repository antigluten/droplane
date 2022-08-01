//
//  PlaceCarouselHorizontalController.swift
//  droplane
//
//  Created by Vladimir Gusev on 09.07.2022.
//

import UIKit
import SDWebImage

final class PlaceCarouselHorizontalController: HorizontalSnappingController {
    weak var coordinator: SearchCoordinator?
    
    override func viewDidLoad() {
        view.backgroundColor = .clear
        collectionView.backgroundColor = .clear
        collectionView.register(PlaceViewCell.self, forCellWithReuseIdentifier: PlaceViewCell.identifier)
        collectionView.contentInset = .init(top: 0, left: 8, bottom: 0, right: 8)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.mock.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceViewCell.identifier, for: indexPath)
                as? PlaceViewCell else { return UICollectionViewCell() }

        let model = MockData.mock[indexPath.item]
        cell.label.text = model.address
        cell.imageView.image = UIImage(named: model.imageName)

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let place = MockData.mock[indexPath.item]
        
//        let placeDetailViewController = PlaceDetailsViewController(place: place)
//        placeDetailViewController.modalPresentationStyle = .fullScreen
        
//        navigationController?.pushViewController(placeDetailViewController, animated: true)
//        show(placeDetailViewController, sender: self)
        coordinator?.navigate(to: .detail, with: place)
    }
}

extension PlaceCarouselHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 16, height: 250)
    }
}

struct MockData {
    static let mock: [Place] = [
        .init(name: "Place 4",
              id: "3",
              address: "The Zinger House",
              formattedRating: "4.82",
              company: "VK",
              price: "299.99£",
              imageName: "zingerHouse"),
        .init(
            name: "Place 5",
            id: "5", address: "VK",
            formattedRating: "5",
            company: "VK inc.",
            price: "99999£",
            imageName: ""),
        .init(name: "Place 1",
              id: "0",
              address: "London mall",
              formattedRating: "4.91",
              company: "Starcourt",
              price: "49.99£",
              imageName: "londonMall"),
        .init(name: "Place 2",
              id: "1",
              address: "House 1",
              formattedRating: "4.2",
              company: "Starcourt",
              price: "499.99£",
              imageName: "starcourt"),
        .init(name: "Place 3",
              id: "2",
              address: "Some Place",
              formattedRating: "4.75",
              company: "Some mem",
              price: "99.99£",
              imageName: "meme")
    ]
}
