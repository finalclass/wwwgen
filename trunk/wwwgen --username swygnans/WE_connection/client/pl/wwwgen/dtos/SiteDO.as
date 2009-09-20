package pl.wwwgen.dtos
{
	import pl.wwwgen.*;

	public class SiteDO extends Element implements IElement
	{
		public var title:String = '';
		public function SiteDO(obj:Object)
		{
			super(obj);
		}
		
	}
}