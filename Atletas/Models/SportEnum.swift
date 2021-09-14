import UIKit

enum SportEnum: String, CaseIterable {
    case softball
    case handeball
    case voleiball

    func getName() -> String {
        switch self {
        case .softball: return "Softbol"
        case .handeball: return "Handebol"
        case .voleiball: return "Vôlei"
        }
    }

    func getImage() -> UIImage? {
        return UIImage(named: self.rawValue)
    }

    func getHeaderImage() -> UIImage? {
        let imageName = "\(self.rawValue)-header"
        return UIImage(named: imageName)
    }
}
