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

    func getSimpleName() -> String {
        switch self {
        case .softball: return "softbol"
        case .handeball: return "handebol"
        case .voleiball: return "volei"
        }
    }

    func getImage() -> UIImage? {
        let imageName = "\(self.getSimpleName())_card"
        return UIImage(named: imageName)
    }

    func getHeaderImage() -> UIImage? {
        let imageName = "\(self.getSimpleName())_background"
        return UIImage(named: imageName)
    }
}
