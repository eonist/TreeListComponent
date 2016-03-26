import Foundation

class MainView:CustomView {
    var container:Section?
    override func resolveSkin() {
        super.resolveSkin()
        StyleManager.addStyle("Section#sectionContainer{fill:orange;float:left;clear:left;}")
        container = addSubView(Section(width,height,self,"sectionContainer"))
        createTreeList()
    }
    /**
     *
     */
    func createTreeList(){
        //create the tree list here
        
    }
    override func createTitleBar() {
        StyleManager.addStylesByURL("~/Desktop/css/titleBar.css")
        StyleManager.addStyle("Section#titleBar{padding-top:16px;padding-bottom:8px;padding-left:12px;}")
        super.createTitleBar()
    }
}
