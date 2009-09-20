package pl.zlasu 
{
	
	/**
	 * ...
	 * @author szymon@wygnanski.com
	 */
	public class Config 
	{
		
		static public const IMAGES_FOLDER:String = '/images';
		
		public function Config(self:Config) 
		{
			if ( self != this ) {
				throw new Error('You cannot instantiate class Config');
			}
		}
		
	}
	
}