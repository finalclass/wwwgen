package pl.wwwgen
{
	public interface IElement
	{
		function get children() : Array;
		function set children(childArr:Array) : void;
		
		function get id() : String;
		function set id(newId:String) : void;
		
		function get parentId() : String;
		function set parentId(parentId:String) : void;
		
	}
}