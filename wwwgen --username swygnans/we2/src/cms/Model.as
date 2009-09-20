package cms {
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.filesystem.FileMode;
  import flash.filesystem.FileStream;
  import flash.filesystem.File;
  import mx.collections.ArrayCollection;

  public class Model extends EventDispatcher {

    static public var DATA_CHANGED:String = "data changed";
    static public var CONTENT_CHANGED:String = "content changed";

    static public var TYPES:ArrayCollection = new ArrayCollection([
		 {label: "Zakladka", data: "folder"},
		 {label: "Tekst", data: "text"},
		 {label: "Galeria", data: "gallery"},
		 {label: "Zdjecie", data: "photo"},
		 {label: "Lista", data: "list"}
		 ]);

    static private var _file:File;
    
    /***********/
    /*Singleton*/
    /***********/
    static private var _selfInstance:Model;
    public function Model(enforcer:SingletonEnforcer) : void { //Private dzieki SingletonEnforcer zadeklarowanej w tym pliku
      Model._file = File.documentsDirectory;
    }

    static public function getInstance() : Model {
      if(Model._selfInstance == null) {
		Model._selfInstance = new Model(new SingletonEnforcer());
      } 
      return Model._selfInstance;
    }

    static public function o() : Model {
      return Model.getInstance();
    }

    /**************/
    /*dataProvider*/
    /*************/
    static private var _dataProvider:XML;
    
    public function set dataProvider(value:XML) : void {
      Model._dataProvider = value;
      dispatchEvent(new Event(Model.DATA_CHANGED));
    }
    static public function get dataProvider() : XML {
      return Model._dataProvider;
    }

    /********/
    /*Content*/
    /*********/
    static private var _content:XML;
    public function set content(value:XML) : void {
      Model._content = value;
      dispatchEvent(new Event(Model.CONTENT_CHANGED));
    }
    static public function get content() : XML {
      return Model._content;
    }

    public function setContentType(newType:String) : void {
      Model._content.@type = newType;
      dispatchEvent(new Event(Model.CONTENT_CHANGED));
    }
    public function setContentLabel(newLabel:String) : void {
      Model._content.@label = newLabel;
    }
    
    public function addNodeToContent(newNode:XML) : void {
      Model._content.prependChild(newNode);
    }

    /******************/
    /*Otwieranie pliku*/
    /******************/
    static public function openFile() : void {
      Model._file.browseForOpen("Otworz");
      Model._file.addEventListener(Event.SELECT, _goOpenFile);
    }

    static private function _goOpenFile(event:Event) : void {
      var currentFile:File = event.target as File;
      var str:FileStream = new FileStream();
      str.open(currentFile, FileMode.READ);
      Model.getInstance().dataProvider = XML(str.readUTFBytes(str.bytesAvailable));
    }
    
  }
}
class SingletonEnforcer {}
