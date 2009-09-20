package pl.zlasu 
{
	import pl.zlasu.panels.base.PanelBase;
	
	/**
	 * ...
	 * @author szymon@wygnanski.com
	 */
	public interface IItem 
	{
		
		function get id() : String;
		
		function set id(newId:String) : void;
		
		function render() : String;
		
		function get children() : Array;
		
		function addChild(child:Item) : Item;
		
		function removeChild(childId:String) : void;
		
		function getPanel() : PanelBase;
		
	}
	
}