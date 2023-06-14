
import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("I'm interested", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "buttonColor")
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Keytar sweenet!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.text = "Portland ugh fashion axe Helvetica. Echo Park Austin gastropub roof party."
        label.textAlignment = .center
        label.numberOfLines = 2
        // Fix font type
        label.font = UIFont(name: "GT Walsheim Pro", size: 10)
        label.textColor = UIColor(red: 0.108, green: 0.127, blue: 0.18, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Fix size image.
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "menCard")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor(named: "buttonColor")
        return pageControl
    }()

    // Make shadow
    let subview = UIView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "fon")
        subview.backgroundColor = .white
        subview.layer.cornerRadius = 15
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {

        view.addSubview(subview)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(button)
        view.addSubview(imageView)
        view.addSubview(pageControl)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(139)
            make.left.equalTo (view).offset(88)
            make.right.equalTo(view).offset(-87)
            make.height.equalTo(imageView.snp.width)
        }

        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(imageView.snp.bottom).offset(103)
        }

        subview.snp.makeConstraints { (make) in
            make.left.equalTo (view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.bottom.equalTo(view).offset(-31)
            make.top.equalTo(pageControl.snp.bottom).offset(35)
        }

        mainLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(view)
            make.top.equalTo(subview.snp.top).offset(34)
        }

        subLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(view)
            make.left.equalTo(subview).offset(29)
            make.top.equalTo(mainLabel.snp.bottom).offset(18)
        }

        button.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.left.equalTo(subview).offset(45)
            make.top.equalTo(subLabel.snp.bottom).offset(50.5)
            make.height.equalTo(48)
        }
    }

    // MARK: - Actions

    @objc private func buttonPressed() {

    }
}
