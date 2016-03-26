import Foundation

class MainView:CustomView {
    var container:Container?
    override func resolveSkin() {
        super.resolveSkin()
        StyleManager.addStyle("Container#listContainer{fill:orange;float:left;clear:left;}")
        container = addSubView(Container(width,height,self,"listContainer"))
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
        StyleManager.addStyle("Section#titleBar{padding-top:16px;padding-left:12px;}")
        super.createTitleBar()
    }
}
