package pl.zlasu {
	import flash.text.TextField;
	import mx.containers.Canvas;
	import mx.controls.Button;
	import mx.controls.Label;

	import pl.zlasu.utils.Broadcaster;
	import pl.zlasu.panels.base.PanelBase;
	
	
	public class Panel {
		
		private var _currentPanel:PanelBase = new PanelBase();
		
		static private var _instance:Panel;
		
		public function Panel(enf:SinglettonEnforcer) : void {
			var t:Label = new Label();
			t.text = 'aaaaa';
			_currentPanel.addChild(t);
		}
		
		static public function getInstance() : Panel {
			if( ! Panel._instance ) {
				Panel._instance = new Panel(new SinglettonEnforcer()); 
			}
			return Panel._instance;
		}
		
		[Bindable]
		public function set currentPanel(p:PanelBase) : void {
			_currentPanel = p;
			Broadcaster.broadcast(new ZEvent(ZEvent.PANEL_CHANGED));
		} 
		public function get currentPanel() : PanelBase {
			return _currentPanel;
		} 
	}
	
}

class SinglettonEnforcer {
	
}