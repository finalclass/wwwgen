package pl.zlasu 
{
	
	/**
	 * ...
	 * @author szymon@wygnanski.com
	 */
	public class SkinManager 
	{
		
		static public const ZSite:String = '' + 
'<html>' + "\n" +  
'	<head>' + "\n" + 
'		<title><as>title</as></title>' + "\n" + 
'		<style type="text/css">' +"\n" + 
'			body {' +"\n" + 
'				background-color: <as>backgroundColor</as>;' +"\n" + 
'			}' +"\n" + 
'			.currentElement { ' +"\n" + 
'				border:solid 2px #ff0000; ' +"\n" + 
'			}' +"\n" + 
'			.ZText {' +"\n" + 
'			}' +"\n" + 
'		</style>' + "\n" + 
'	</head>' + "\n" + 
'	<body id="<as>id</as>" name="item">' + "\n" + 
'		<h2><as>title</as></h2>' + "\n" + 
'		<as>url</as>' +"\n" + 
'		<hr/><children/>' +"\n" + 
'	</body>' + "\n" + 
'</html>';
		
		static public const ZText:String = '<p id="<as>id</as>" name="item" class="ZText"><as>text</as></p>' + "\n";
		
		static public const ZImage:String = '<img src="<as>imageUrl</as>" name="item" id="<as>id</as>" class="ZImage" width="<as>width</as>" height="<as>height</as>"/>' + "\n";
		
		static public const standard:String = '<children/>' + "\n";
		
		public function SkinManager() 
		{
			
		}
		
	}
	
}