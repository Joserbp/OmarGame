
import SpriteKit

class HUDNode : SKNode{
   
    //MARK: - Properties
    private var topScoreShape : SKShapeNode!
    private var topScoreLbl : SKLabelNode!
    
    private var gameOverShape : SKShapeNode!
    private var gameOverNode : SKSpriteNode!
    
    private var homeNode : SKSpriteNode!
    private var againNode : SKSpriteNode!
    
    //MARK: - Initializers
    override init(){
        super.init()
        setupTopScore()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches , with: event)
        guard let touch = touches.first else {return}
        let node = atPoint(touch.location(in: self))
        
        if node.name == "Home" {
            print("Home")
        }
        if node.name == "PlayAgain" {
            print("PlayAgain")
        }
    }
    
}

//MARK: - Setups

extension HUDNode{
    
    private func setupTopScore(){
        let statusH : CGFloat = appDL.isIPhoneX ? 88 : 48
        let scoreY : CGFloat = screenHeight - (statusH + 90/2 + 20)
        
        topScoreShape = SKShapeNode(rectOf: CGSize(width: 220 , height: 90), cornerRadius: 8.0)
        topScoreShape.fillColor = UIColor (hex: 0x000000, alpha: 0.5)
        topScoreShape.zPosition = 20
        topScoreShape.position = CGPoint (x: screenWidth/2 , y:scoreY)
        addChild(topScoreShape)
        
        topScoreLbl = SKLabelNode(fontNamed: FontName.wheaton)
        topScoreLbl.fontSize = 60.0
        topScoreLbl.text = "0"
        topScoreLbl.fontColor = .white
        topScoreLbl.zPosition = 25.0
        topScoreLbl.position = CGPoint(x: topScoreShape.frame.midX, y: topScoreShape.frame.midY - topScoreLbl.frame.height/2)
        addChild(topScoreLbl)
    }
    
    func updateScore(_ score : Int){
    topScoreLbl.text = "\(score)"
        topScoreLbl.run(.sequence([
            .scale(to: 1.3, duration : 0.1),
            .scale(to: 1.0, duration : 0.1),
        ]))
    }
}

//MARK: - GameOver

extension HUDNode{

    func setupGameOver(){
        gameOverShape = SKShapeNode(rect: CGRect(x : 0.0, y: 0.0, width: screenWidth, height : screenHeight))
        gameOverShape.zPosition = 49.0
        gameOverShape.fillColor = UIColor(hex: 0x000000, alpha: 0.7)
        addChild(gameOverShape)
        
        let scale : CGFloat = appDL.isIPhoneX ? 0.6 : 0.7
        
        //TODO: - GameOverNode
        gameOverNode = SKSpriteNode(imageNamed: "panel-gameOver")
        gameOverNode.setScale(scale)
        gameOverNode.zPosition = 50.0
        gameOverNode.position = CGPoint(x: screenWidth/2, y: screenHeight/2)
        addChild(gameOverNode)
        
        
        //TODO: - HomeNode
        homeNode = SKSpriteNode(imageNamed: "icon-home")
        homeNode.setScale(scale)
        homeNode.zPosition = 55.0
        homeNode.position = CGPoint(
            x: gameOverNode.frame.minX + homeNode.frame.width/2 + 30,
            y: gameOverNode.frame.minY + homeNode.frame.height/2 + 30)
        homeNode.name = "Home"
        addChild(homeNode)
        
        //TODO: - PlayAgainNode
        againNode = SKSpriteNode(imageNamed: "icon-playAgain")
        againNode.setScale(scale)
        againNode.zPosition = 55.0
        againNode.position = CGPoint(
            x: gameOverNode.frame.maxX + homeNode.frame.width/2 - 30,
            y: gameOverNode.frame.minY + homeNode.frame.height/2 + 30)
        againNode.name = "PlayAgain"
        addChild(againNode)
    }


}


