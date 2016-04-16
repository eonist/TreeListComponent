import Foundation

class MainView:CustomView {
    var container:Section?
    var fileWatcher:FileWatcher?
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
        
        let url:String = "~/Desktop/css/treelistdemo.css"
        StyleManager.addStylesByURL(url,true)
        
        fileWatcher = FileWatcher([url.tildePath])
        fileWatcher!.event = { event in
            //Swift.print(self)
            Swift.print(event.description)
            if(event.fileChange && event.path == url.tildePath) {
                StyleManager.addStylesByURL(url,true)
                ElementModifier.refreshSkin(self)
                ElementModifier.floatChildren(self)
            }
        }
        fileWatcher!.start()
        
        let xml:NSXMLElement = FileParser.xml("~/Desktop/assets/xml/treelist.xml")
        treeList = container!.addSubView(TreeList(140, 288, 24, Node(xml), container))
        

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
        
        //Swift.print("\(treeList.node.xml)")
        
        //treeList
        
        func onTreeListEvent(event: Event) {//add local event handler
            if(event.type == SelectEvent.select && event.immediate === treeList){
                //Swift.print("onTreeListSelect()")
                let selectedIndex:Array = TreeListParser.selectedIndex(treeList)
                Swift.print("selectedIndex: " + "\(selectedIndex)")
                //print("_scrollTreeList.database.xml.toXMLString(): " + _scrollTreeList.database.xml.toXMLString());
                let selectedXML:NSXMLElement = XMLParser.childAt(treeList.node.xml, selectedIndex)!
                //print("selectedXML: " + selectedXML);
                Swift.print("selectedXML.toXMLString():")
                Swift.print(selectedXML)//EXAMPLE output: <item title="Ginger"></item>
            }
        }
        treeList.event = onTreeListEvent//add local event listener
        

        //TODO: try the move up and move down calls
    }
    override func createTitleBar() {
        StyleManager.addStylesByURL("~/Desktop/css/titleBar.css")
        StyleManager.addStyle("Section#titleBar{padding-top:16px;padding-bottom:8px;padding-left:12px;}")
        super.createTitleBar()
    }
}
