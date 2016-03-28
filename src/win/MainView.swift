import Foundation

class MainView:CustomView {
    var container:Section?
    override func resolveSkin() {
        super.resolveSkin()
        StyleManager.addStyle("Section#sectionContainer{fill:orange;float:left;clear:left;}")
        container = addSubView(Section(width,height,self,"sectionContainer"))
        createTreeList()
        
        //StyleManager.addStyle("Slider [Button,Thumb] Element{fill-alpha:1;}")//testing grouping
    }
    /**
     *
     */
    
    var treeList:TreeList!
    
    func createTreeList(){
        StyleManager.addStylesByURL("~/Desktop/css/treelistdemo.css")
        
        let xml:NSXMLElement = FileParser.xml("~/Desktop/assets/xml/treelist.xml")
         = container!.addSubView(TreeList(140, 288, 24, Node(xml), container))
        

        Swift.print("selected: " + "\(TreeListParser.selected(treeList))")
        Swift.print("selectedIndex: " + "\(TreeListParser.selectedIndex(treeList))")//Output:  [2,2,0]
        Swift.print("selected Title: " + "\(XMLParser.attributesAt(treeList.node.xml, TreeListParser.selectedIndex(treeList))!["title"])")//Output: Oregano
        TreeListModifier.unSelectAll(treeList)
        
        TreeListModifier.selectAt(treeList, [2])
        TreeListModifier.collapseAt(treeList, [])//closes the treeList
        TreeListModifier.explodeAt(treeList,[])//opens the treeList
        

        treeList.node.removeAt([1])
        treeList.node.addAt([1],  NSXMLElement("<item title=\"Fish\"/>"))/*new*/
        /**/
        
        Swift.print("\(treeList.node.xml)")
        
        
        var selectedIndex:Array = TreeListParser.selectedIndex(_sliderTreeList);
        print("selectedIndex: " + selectedIndex);
        //			trace("_scrollTreeList.database.xml.toXMLString(): " + _scrollTreeList.database.xml.toXMLString());
        var selectedXML:XML = DatabaseParser.itemAt(_sliderTreeList.database, selectedIndex);
        //			trace("selectedXML: " + selectedXML);
        print("selectedXML.toXMLString(): \n" + selectedXML.toXMLString());
        
        
        
        //TODO: try the move up and move down calls
    }
    override func createTitleBar() {
        StyleManager.addStylesByURL("~/Desktop/css/titleBar.css")
        StyleManager.addStyle("Section#titleBar{padding-top:16px;padding-bottom:8px;padding-left:12px;}")
        super.createTitleBar()
    }
}
